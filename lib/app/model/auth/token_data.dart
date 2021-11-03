// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_data.g.dart';
part 'token_data.freezed.dart';

@freezed
class TokenData with _$TokenData {
  factory TokenData({
    @JsonKey(name: 'access') required String accessToken,
    @JsonKey(name: 'refresh') String? refreshToken,
  }) = _TokenData;

  factory TokenData.fromJson(Map<String, dynamic> json) =>
      _$TokenDataFromJson(json);
}

@freezed
class TokenRequest with _$TokenRequest {
  factory TokenRequest({
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'refresh_token') required String refreshToken,
  }) = _TokenRequest;

  factory TokenRequest.fromJson(Map<String, dynamic> json) =>
      _$TokenRequestFromJson(json);
}

@freezed
class LoginRequest with _$LoginRequest {
  factory LoginRequest({
    @JsonKey(name: 'access_token') required String accessToken,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
}
