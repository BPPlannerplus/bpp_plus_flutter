import 'package:bpp_riverpod/app/api/auth_client.dart';
import 'package:bpp_riverpod/app/model/auth/token_data.dart';
import 'package:bpp_riverpod/app/model/auth/user_info.dart';
import 'package:bpp_riverpod/app/provider/auth/user_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();

  dio.interceptors.add(CustomLogInterceptor());

  final authClient =
      AuthClient(Dio()..interceptors.add(CustomLogInterceptor()));

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        final tokenData = ref.read(tokenDataProvider);
        // final token = Hive.box('auth').get('token');
        final userInfo = Hive.box('auth').get('userInfo');

        if (tokenData.accessToken.isEmpty) {
          dio.lock();
          authClient
              .newToken(
            UserInfoRequest(
              userInfo: userInfo,
            ),
          )
              .then(
            (d) {
              logger.d('access_token: ${d.accessToken}');
              logger.d('refresh_token: ${d.refreshToken}');
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
        final token = ref.read(tokenDataProvider);
        final userInfo = Hive.box('auth').get('userInfo');
        print(token.accessToken);

        // refreshToken 만료
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
          dio.interceptors.responseLock.lock();
          dio.interceptors.errorLock.lock();

          authClient
              .refreshToken(
            TokenRequest(
              userId: userInfo!.uid,
              refreshToken: token.refreshToken!,
            ),
          )
              .then(
            (d) {
              Hive.box('auth').put('token', token.refreshToken!);
              options.headers['Authorization'] = 'Bearer ${token.accessToken}';
            },
          ).whenComplete(
            () {
              dio.unlock();
              dio.interceptors.responseLock.unlock();
              dio.interceptors.errorLock.unlock();
            },
          ).then(
            (e) {
              dio.fetch(options).then(
                (r) => handler.resolve(r),
                onError: (e) {
                  handler.reject(e);
                },
              );
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
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    print('REQUEST DATA: ${options.data}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    print('RESPONSE DATA => DATA: ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    print('ERROR headers: [${err.requestOptions.headers}]');
    print('ERROR err: [${err.error}]');
    print('ERROR msg: [${err.message}]');
    print('ERROR stack: [${err.stackTrace}]');
    super.onError(err, handler);
  }
}
