import 'package:bpp_riverpod/app/model/auth/user_info.dart';
import 'package:bpp_riverpod/app/model/auth/token_data.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_client.g.dart';

@RestApi(baseUrl: 'https://bpplaner.shop')
abstract class AuthClient {
  factory AuthClient(
    Dio dio, {
    String baseUrl,
  }) = _AuthClient;

  @POST('/login/rest-auth/kakao/')
  Future<UserInfoResponse> kakaoLogin(@Body() LoginRequest token);

  @POST('/login/new-token/')
  Future<TokenData> newToken(@Body() UserInfoRequest userInfoRequest);

  @POST('/login/token/refresh/')
  Future<TokenData> refreshToken(@Body() TokenRequest tokenRequest);

  @DELETE('/login/withdrawal/')
  Future<dynamic> withdraw();
}
