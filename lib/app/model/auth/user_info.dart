import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

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
  @HiveType(typeId: 1, adapterName: 'UserInfoAdapter')
  factory UserInfo({
    @HiveField(0) required int uid,
    @JsonKey(name: 'username') @HiveField(1) required String userName,
    @HiveField(2) required int pk,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}
