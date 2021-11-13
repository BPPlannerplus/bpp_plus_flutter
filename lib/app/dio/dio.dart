import 'package:bpp_riverpod/app/api/auth_client.dart';
import 'package:bpp_riverpod/app/model/auth/token_data.dart';
import 'package:bpp_riverpod/app/model/auth/user_info.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final tokenDioProvider = Provider<Dio>((ref) => tokenDio);
final dioProvider = Provider<Dio>((ref) => dio);

var logger = Logger();

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
          authClient
              .newToken(UserInfoRequest(
                  userInfo: UserInfo(uid: 123123, userName: 'leeeeeoy', pk: 2)))
              .then((d) {
            logger.d('access_token: ${d.accessToken}');
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

          authClient
              .refreshToken(TokenRequest(userId: 1, refreshToken: '123123'))
              .then((d) {
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
