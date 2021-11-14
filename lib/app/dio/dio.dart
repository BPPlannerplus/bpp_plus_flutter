import 'package:bpp_riverpod/app/api/auth_client.dart';
import 'package:bpp_riverpod/app/api/shop_client.dart';
import 'package:bpp_riverpod/app/model/auth/token_data.dart';
import 'package:bpp_riverpod/app/model/auth/user_info.dart';
import 'package:bpp_riverpod/app/provider/auth/shared_provider.dart';
import 'package:bpp_riverpod/app/provider/auth/user_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();

final authClientProvider = Provider<AuthClient>((ref) {
  // final dio = ref.watch(dioProvider);
  return AuthClient(Dio());
});

final shopClientProvier = Provider<ShopClient>((ref) {
  final dio = ref.watch(dioProvider);
  return ShopClient(dio);
});

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();

  dio.interceptors.add(CustomLogInterceptor());

  final authClient =
      AuthClient(Dio()..interceptors.add(CustomLogInterceptor()));

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = ref.read(tokenDataProvider);
        final prefs = await ref.read(sharedProvider.future);
        final userInfo = ref.read(userInfoProvider);
        logger.d('access_token: ${token.accessToken}');
        logger.d('refresh_token: ${token.refreshToken}');
        logger.d('token.accessToken.isEmpty: ${token.accessToken.isEmpty}');

        if (token.accessToken.isEmpty) {
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
              ref.read(tokenDataProvider.state).state = token.copyWith(
                  accessToken: d.accessToken, refreshToken: d.refreshToken);
              options.headers['Authorization'] = 'Bearer ${token.accessToken}';
              prefs.setString('token', token.refreshToken!);
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
          options.headers['Authorization'] = 'Bearer ${token.accessToken}';
          return handler.next(options);
        }
      },
      onError: (error, handler) async {
        final token = ref.read(tokenDataProvider);
        final userInfo = ref.read(userInfoProvider);

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
              .refreshToken(TokenRequest(
                  userId: userInfo.pk, refreshToken: token.refreshToken!))
              .then((d) {
            ref.read(tokenDataProvider.state).state =
                token.copyWith(accessToken: d.accessToken);
            options.headers['Authorization'] = 'Bearer ${token.accessToken}';
          }).whenComplete(() {
            dio.unlock();
            dio.interceptors.responseLock.unlock();
            dio.interceptors.errorLock.unlock();
          }).then((e) {
            dio.fetch(options).then((r) => handler.resolve(r), onError: (e) {
              handler.reject(e);
            });
          });
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
    super.onError(err, handler);
  }
}
