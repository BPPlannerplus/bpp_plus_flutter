// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserInfoResponse _$$_UserInfoResponseFromJson(Map<String, dynamic> json) =>
    _$_UserInfoResponse(
      token: json['token'] as String,
      userInfo: UserInfo.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserInfoResponseToJson(_$_UserInfoResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.userInfo,
    };

_$_UserInfoRequest _$$_UserInfoRequestFromJson(Map<String, dynamic> json) =>
    _$_UserInfoRequest(
      userInfo: UserInfo.fromJson(json['user_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserInfoRequestToJson(_$_UserInfoRequest instance) =>
    <String, dynamic>{
      'user_info': instance.userInfo,
    };

_$_UserInfo _$$_UserInfoFromJson(Map<String, dynamic> json) => _$_UserInfo(
      uid: json['uid'] as int,
      userName: json['username'] as String,
      pk: json['pk'] as int,
    );

Map<String, dynamic> _$$_UserInfoToJson(_$_UserInfo instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'username': instance.userName,
      'pk': instance.pk,
    };
