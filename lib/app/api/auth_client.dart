import 'package:bpp_riverpod/app/model/token_data.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_client.g.dart';

@RestApi(baseUrl: "http://localhose:8080")
abstract class AuthClient {
  factory AuthClient(
    Dio dio, {
    String baseUrl,
  }) = _AuthClient;

  @POST('/login/new-token/')
  Future<TokenData> login(@Body() TokenData token);

  @POST('/login/token/refresh/')
  Future<TokenData> newToken(@Body() TokenRequest tokenRequest);

  @DELETE('/login/withdrawal/')
  Future<void> withdraw();
}
