// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserInfoAdapter extends TypeAdapter<_$_UserInfo> {
  @override
  final int typeId = 1;

  @override
  _$_UserInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_UserInfo(
      uid: fields[0] as int,
      userName: fields[1] as String,
      pk: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, _$_UserInfo obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.userName)
      ..writeByte(2)
      ..write(obj.pk);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
