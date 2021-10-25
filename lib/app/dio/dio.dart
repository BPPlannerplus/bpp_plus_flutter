import 'package:bpp_riverpod/app/api/auth_client.dart';
import 'package:bpp_riverpod/app/model/token_data.dart';
import 'package:dio/dio.dart';

Dio tokenDio = Dio();

AuthClient authClient = AuthClient(tokenDio);

String? myToken;

Dio dio = Dio(
  BaseOptions(
    headers: {
      'Authorization': 'Bearer $myToken',
    },
  ),
)..interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        if (myToken == null) {
          dio.lock();
          authClient.login(TokenData(accessToken: 'access_token')).then((d) {
            myToken = d.accessToken;
            options.headers['Authorization'] = myToken;
            handler.next(options);
          }).catchError((error, stackTrace) {
            handler.reject(error, true);
          }).whenComplete(() => dio.unlock());
        } else {
          options.headers['Authorization'] = myToken;
          return handler.next(options);
        }
      },
      onError: (error, handler) {
        if (error.response?.statusCode == 401) {
          var options = error.response!.requestOptions;
          if (myToken != options.headers['Authorization']) {
            options.headers['Authorization'] = myToken;
            dio.fetch(options).then((r) => handler.resolve(r), onError: (e) {
              handler.reject(e);
            });
            return;
          }
          dio.lock();

          dio.interceptors.responseLock.lock();

          dio.interceptors.errorLock.lock();

          authClient.login(TokenData(accessToken: 'access_token')).then((d) {
            myToken = d.accessToken;
            options.headers['Authorization'] = myToken;
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
