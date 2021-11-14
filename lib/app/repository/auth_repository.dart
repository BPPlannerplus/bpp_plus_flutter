import 'package:bpp_riverpod/app/api/auth_client.dart';
import 'package:bpp_riverpod/app/dio/dio.dart';
import 'package:bpp_riverpod/app/model/auth/token_data.dart';
import 'package:bpp_riverpod/app/model/auth/user_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authClient = ref.watch(authClientProvider);
  return AuthRepository(authClient: authClient);
});

class AuthRepository {
  AuthRepository({required this.authClient});
  final AuthClient authClient;

  Future<UserInfoResponse> kakaoLogin(LoginRequest token) async {
    final userData = await authClient.kakaoLogin(token);
    return userData;
  }

  Future<TokenData> getNewToken(UserInfoRequest userInfoRequest) async {
    final tokenData = await authClient.newToken(userInfoRequest);
    return tokenData;
  }

  Future<TokenData> refreshToken(TokenRequest tokenRequest) async {
    final tokenData = await authClient.refreshToken(tokenRequest);
    return tokenData;
  }

  Future<dynamic> withdraw() async {
    return await authClient.withdraw();
  }
}
