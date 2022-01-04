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

  dio.interceptors.add(
    QueuedInterceptorsWrapper(
      //  accessToken 헤더에 추가
      onRequest: (options, handler) async {
        final accessToken = Hive.box('auth').get('accessToken');
        options.headers['Authorization'] = 'Bearer $accessToken';
        handler.next(options);
      },
      onError: (error, handler) async {
        final userInfo = Hive.box('auth').get('userInfo');
        final refreshToken = Hive.box('auth').get('refreshToken');

        // accessToken 만료
        if (error.response?.statusCode == 401) {
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
