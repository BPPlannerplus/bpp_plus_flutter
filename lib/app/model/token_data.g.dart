// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TokenData _$$_TokenDataFromJson(Map<String, dynamic> json) => _$_TokenData(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String?,
    );

Map<String, dynamic> _$$_TokenDataToJson(_$_TokenData instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };

_$_TokenRequest _$$_TokenRequestFromJson(Map<String, dynamic> json) =>
    _$_TokenRequest(
      userId: json['user_id'] as int,
      refreshToken: json['refresh_token'] as String,
    );

Map<String, dynamic> _$$_TokenRequestToJson(_$_TokenRequest instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'refresh_token': instance.refreshToken,
    };
