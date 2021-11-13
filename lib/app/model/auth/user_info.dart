import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info.g.dart';
part 'user_info.freezed.dart';

@freezed
class UserInfoResponse with _$UserInfoResponse {
  factory UserInfoResponse({
    required String token,
    @JsonKey(name: 'user') required UserInfo userInfo,
  }) = _UserInfoResponse;

  factory UserInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$UserInfoResponseFromJson(json);
}

@freezed
class UserInfoRequest with _$UserInfoRequest {
  factory UserInfoRequest({
    @JsonKey(name: 'user_info') required UserInfo userInfo,
  }) = _UserInfoRequest;

  factory UserInfoRequest.fromJson(Map<String, dynamic> json) =>
      _$UserInfoRequestFromJson(json);
}

@freezed
class UserInfo with _$UserInfo {
  factory UserInfo({
    required int uid,
    @JsonKey(name: 'username') required String userName,
    required int pk,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}
