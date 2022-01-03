import 'dart:developer' as dp;

import 'package:bpp_riverpod/app/model/auth/token_data.dart';
import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/ui/components/dialog/bpp_alert_dialog.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();

  final authDio = Dio();

  dio.interceptors.add(CustomLogInterceptor());

  dio.interceptors.add(
    QueuedInterceptorsWrapper(
      //  accessToken 헤더에 추가
      onRequest: (options, handler) async {
        dp.log('>>> onRequest <<<');
        final accessToken = Hive.box('auth').get('accessToken');
        options.headers['Authorization'] = 'Bearer $accessToken';
        handler.next(options);
      },
      onError: (error, handler) async {
        final userInfo = Hive.box('auth').get('userInfo');
        final refreshToken = Hive.box('auth').get('refreshToken');

        // accessToken 만료
        if (error.response?.statusCode == 401) {
          dp.log('>>> accessToken 재요청 <<<');
          var options = error.response!.requestOptions;

          authDio
              .post('https://bpplaner.shop/login/token/refresh/',
                  data: TokenRequest(
                          userId: userInfo!.pk, refreshToken: refreshToken!)
                      .toJson())
              .then(
            (d) async {
              final tokenData = TokenData.fromJson(d.data);

              options.headers['Authorization'] =
                  'Bearer ${tokenData.accessToken}';
              await Hive.box('auth').put('accessToken', tokenData.accessToken);
              dio.fetch(options).then((r) => handler.resolve(r));
            },
          ).catchError(
            //  refreshToken 만료
            (error, stackTrace) async {
              dp.log('>>> refreshToken 만료 <<<');
              await ref.read(navigatorProvider).openDialog(
                  bppAlertDialog(title: '다시 로그인해주세요!', confirm: () {}));
              ref
                  .watch(navigatorProvider)
                  .navigateToRemove(routeName: AppRoutes.loginPage);
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
    dp.log('REQUEST HEADER[${options.headers}]');
    dp.log('REQUEST DATA: ${options.data}');
    dp.log('REQUEST PARAM: ${options.queryParameters}');
    dp.log('REQUEST URI: ${options.uri}');
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
    dp.log('ERROR stack: [${err.stackTrace}]');
    super.onError(err, handler);
  }
}
