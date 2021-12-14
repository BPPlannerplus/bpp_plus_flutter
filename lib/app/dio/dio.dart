import 'dart:developer' as dp;

import 'package:bpp_riverpod/app/api/auth_client.dart';
import 'package:bpp_riverpod/app/model/auth/token_data.dart';
import 'package:bpp_riverpod/app/model/auth/user_info.dart';
import 'package:bpp_riverpod/app/provider/auth/user_provider.dart';
import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();

  dio.interceptors.add(CustomLogInterceptor());

  final authClient =
      AuthClient(Dio()..interceptors.add(CustomLogInterceptor()));

  dio.interceptors.add(
    QueuedInterceptorsWrapper(
      onRequest: (options, handler) async {
        dp.log('>>> onRequest <<<');
        final tokenData = ref.read(tokenDataProvider);
        final userInfo = Hive.box('auth').get('userInfo');

        if (tokenData.accessToken.isEmpty) {
          dio.lock();
          authClient.newToken(UserInfoRequest(userInfo: userInfo)).then(
            (d) {
              ref.read(tokenDataProvider.state).state = d;
              options.headers['Authorization'] = 'Bearer ${d.accessToken}';
              Hive.box('auth').put('token', d.refreshToken);
              handler.next(options);
            },
          ).catchError(
            (error, stackTrace) {
              handler.reject(error, true);
            },
          ).whenComplete(
            () => dio.unlock(),
          );
        } else {
          options.headers['Authorization'] = 'Bearer ${tokenData.accessToken}';
          return handler.next(options);
        }
      },
      onError: (error, handler) async {
        dp.log('>>> onError <<<');
        final token = ref.read(tokenDataProvider);
        final userInfo = Hive.box('auth').get('userInfo');

        // accessToken 만료
        if (error.response?.statusCode == 401) {
          var options = error.response!.requestOptions;
          if ('Bearer ${token.accessToken}' !=
              options.headers['Authorization']) {
            options.headers['Authorization'] = 'Bearer ${token.accessToken}';
            dio.fetch(options).then((r) => handler.resolve(r), onError: (e) {
              handler.reject(e);
            });
            return;
          }
          dio.lock();

          await authClient
              .refreshToken(TokenRequest(
                  userId: userInfo!.uid, refreshToken: token.refreshToken!))
              .then(
                (d) {
                  Hive.box('auth').put('token', token.refreshToken!);
                  options.headers['Authorization'] =
                      'Bearer ${token.accessToken}';
                },
              )
              .whenComplete(() => dio.unlock())
              .then(
                (e) {
                  dio.fetch(options).then(
                    (r) => handler.resolve(r),
                    onError: (e) {
                      dp.log('>>> onError onError <<<');
                      ref.read(navigatorProvider).navigateToRemove(
                            routeName: AppRoutes.loginPage,
                          );
                      handler.reject(e);
                    },
                  );
                },
              )
              .catchError(
                //  refreshToken 만료
                (error, stackTrace) {
                  dp.log('>>> onError onError onError <<<');
                  ref.read(navigatorProvider).navigateToRemove(
                        routeName: AppRoutes.loginPage,
                      );
                  handler.reject(error);
                },
              );
          return;
        }
        return handler.next(error);
      },
    ),
  );
  return dio;
});

class CustomLogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    dp.log('REQUEST[${options.method}] => PATH: ${options.path}');
    dp.log('REQUEST DATA: ${options.data}');
    dp.log('REQUEST PARAM: ${options.queryParameters}');
    dp.log('REQUEST URL: ${options.uri}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    dp.log(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    dp.log('RESPONSE DATA => DATA: ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    dp.log(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    dp.log('ERROR headers: [${err.requestOptions.headers}]');
    dp.log('ERROR err: [${err.error}]');
    dp.log('ERROR msg: [${err.message}]');
    // dp.log('ERROR stack: [${err.stackTrace}]');
    super.onError(err, handler);
  }
}
