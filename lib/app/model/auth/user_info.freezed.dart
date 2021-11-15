// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserInfoResponse _$UserInfoResponseFromJson(Map<String, dynamic> json) {
  return _UserInfoResponse.fromJson(json);
}

/// @nodoc
class _$UserInfoResponseTearOff {
  const _$UserInfoResponseTearOff();

  _UserInfoResponse call(
      {required String token,
      @JsonKey(name: 'user') required UserInfo userInfo}) {
    return _UserInfoResponse(
      token: token,
      userInfo: userInfo,
    );
  }

  UserInfoResponse fromJson(Map<String, Object?> json) {
    return UserInfoResponse.fromJson(json);
  }
}

/// @nodoc
const $UserInfoResponse = _$UserInfoResponseTearOff();

/// @nodoc
mixin _$UserInfoResponse {
  String get token => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  UserInfo get userInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInfoResponseCopyWith<UserInfoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoResponseCopyWith<$Res> {
  factory $UserInfoResponseCopyWith(
          UserInfoResponse value, $Res Function(UserInfoResponse) then) =
      _$UserInfoResponseCopyWithImpl<$Res>;
  $Res call({String token, @JsonKey(name: 'user') UserInfo userInfo});

  $UserInfoCopyWith<$Res> get userInfo;
}

/// @nodoc
class _$UserInfoResponseCopyWithImpl<$Res>
    implements $UserInfoResponseCopyWith<$Res> {
  _$UserInfoResponseCopyWithImpl(this._value, this._then);

  final UserInfoResponse _value;
  // ignore: unused_field
  final $Res Function(UserInfoResponse) _then;

  @override
  $Res call({
    Object? token = freezed,
    Object? userInfo = freezed,
  }) {
    return _then(_value.copyWith(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      userInfo: userInfo == freezed
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo,
    ));
  }

  @override
  $UserInfoCopyWith<$Res> get userInfo {
    return $UserInfoCopyWith<$Res>(_value.userInfo, (value) {
      return _then(_value.copyWith(userInfo: value));
    });
  }
}

/// @nodoc
abstract class _$UserInfoResponseCopyWith<$Res>
    implements $UserInfoResponseCopyWith<$Res> {
  factory _$UserInfoResponseCopyWith(
          _UserInfoResponse value, $Res Function(_UserInfoResponse) then) =
      __$UserInfoResponseCopyWithImpl<$Res>;
  @override
  $Res call({String token, @JsonKey(name: 'user') UserInfo userInfo});

  @override
  $UserInfoCopyWith<$Res> get userInfo;
}

/// @nodoc
class __$UserInfoResponseCopyWithImpl<$Res>
    extends _$UserInfoResponseCopyWithImpl<$Res>
    implements _$UserInfoResponseCopyWith<$Res> {
  __$UserInfoResponseCopyWithImpl(
      _UserInfoResponse _value, $Res Function(_UserInfoResponse) _then)
      : super(_value, (v) => _then(v as _UserInfoResponse));

  @override
  _UserInfoResponse get _value => super._value as _UserInfoResponse;

  @override
  $Res call({
    Object? token = freezed,
    Object? userInfo = freezed,
  }) {
    return _then(_UserInfoResponse(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      userInfo: userInfo == freezed
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserInfoResponse implements _UserInfoResponse {
  _$_UserInfoResponse(
      {required this.token, @JsonKey(name: 'user') required this.userInfo});

  factory _$_UserInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$$_UserInfoResponseFromJson(json);

  @override
  final String token;
  @override
  @JsonKey(name: 'user')
  final UserInfo userInfo;

  @override
  String toString() {
    return 'UserInfoResponse(token: $token, userInfo: $userInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserInfoResponse &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token, userInfo);

  @JsonKey(ignore: true)
  @override
  _$UserInfoResponseCopyWith<_UserInfoResponse> get copyWith =>
      __$UserInfoResponseCopyWithImpl<_UserInfoResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserInfoResponseToJson(this);
  }
}

abstract class _UserInfoResponse implements UserInfoResponse {
  factory _UserInfoResponse(
      {required String token,
      @JsonKey(name: 'user') required UserInfo userInfo}) = _$_UserInfoResponse;

  factory _UserInfoResponse.fromJson(Map<String, dynamic> json) =
      _$_UserInfoResponse.fromJson;

  @override
  String get token;
  @override
  @JsonKey(name: 'user')
  UserInfo get userInfo;
  @override
  @JsonKey(ignore: true)
  _$UserInfoResponseCopyWith<_UserInfoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

UserInfoRequest _$UserInfoRequestFromJson(Map<String, dynamic> json) {
  return _UserInfoRequest.fromJson(json);
}

/// @nodoc
class _$UserInfoRequestTearOff {
  const _$UserInfoRequestTearOff();

  _UserInfoRequest call(
      {@JsonKey(name: 'user_info') required UserInfo userInfo}) {
    return _UserInfoRequest(
      userInfo: userInfo,
    );
  }

  UserInfoRequest fromJson(Map<String, Object?> json) {
    return UserInfoRequest.fromJson(json);
  }
}

/// @nodoc
const $UserInfoRequest = _$UserInfoRequestTearOff();

/// @nodoc
mixin _$UserInfoRequest {
  @JsonKey(name: 'user_info')
  UserInfo get userInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInfoRequestCopyWith<UserInfoRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoRequestCopyWith<$Res> {
  factory $UserInfoRequestCopyWith(
          UserInfoRequest value, $Res Function(UserInfoRequest) then) =
      _$UserInfoRequestCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'user_info') UserInfo userInfo});

  $UserInfoCopyWith<$Res> get userInfo;
}

/// @nodoc
class _$UserInfoRequestCopyWithImpl<$Res>
    implements $UserInfoRequestCopyWith<$Res> {
  _$UserInfoRequestCopyWithImpl(this._value, this._then);

  final UserInfoRequest _value;
  // ignore: unused_field
  final $Res Function(UserInfoRequest) _then;

  @override
  $Res call({
    Object? userInfo = freezed,
  }) {
    return _then(_value.copyWith(
      userInfo: userInfo == freezed
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo,
    ));
  }

  @override
  $UserInfoCopyWith<$Res> get userInfo {
    return $UserInfoCopyWith<$Res>(_value.userInfo, (value) {
      return _then(_value.copyWith(userInfo: value));
    });
  }
}

/// @nodoc
abstract class _$UserInfoRequestCopyWith<$Res>
    implements $UserInfoRequestCopyWith<$Res> {
  factory _$UserInfoRequestCopyWith(
          _UserInfoRequest value, $Res Function(_UserInfoRequest) then) =
      __$UserInfoRequestCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'user_info') UserInfo userInfo});

  @override
  $UserInfoCopyWith<$Res> get userInfo;
}

/// @nodoc
class __$UserInfoRequestCopyWithImpl<$Res>
    extends _$UserInfoRequestCopyWithImpl<$Res>
    implements _$UserInfoRequestCopyWith<$Res> {
  __$UserInfoRequestCopyWithImpl(
      _UserInfoRequest _value, $Res Function(_UserInfoRequest) _then)
      : super(_value, (v) => _then(v as _UserInfoRequest));

  @override
  _UserInfoRequest get _value => super._value as _UserInfoRequest;

  @override
  $Res call({
    Object? userInfo = freezed,
  }) {
    return _then(_UserInfoRequest(
      userInfo: userInfo == freezed
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserInfoRequest implements _UserInfoRequest {
  _$_UserInfoRequest({@JsonKey(name: 'user_info') required this.userInfo});

  factory _$_UserInfoRequest.fromJson(Map<String, dynamic> json) =>
      _$$_UserInfoRequestFromJson(json);

  @override
  @JsonKey(name: 'user_info')
  final UserInfo userInfo;

  @override
  String toString() {
    return 'UserInfoRequest(userInfo: $userInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserInfoRequest &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userInfo);

  @JsonKey(ignore: true)
  @override
  _$UserInfoRequestCopyWith<_UserInfoRequest> get copyWith =>
      __$UserInfoRequestCopyWithImpl<_UserInfoRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserInfoRequestToJson(this);
  }
}

abstract class _UserInfoRequest implements UserInfoRequest {
  factory _UserInfoRequest(
          {@JsonKey(name: 'user_info') required UserInfo userInfo}) =
      _$_UserInfoRequest;

  factory _UserInfoRequest.fromJson(Map<String, dynamic> json) =
      _$_UserInfoRequest.fromJson;

  @override
  @JsonKey(name: 'user_info')
  UserInfo get userInfo;
  @override
  @JsonKey(ignore: true)
  _$UserInfoRequestCopyWith<_UserInfoRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return _UserInfo.fromJson(json);
}

/// @nodoc
class _$UserInfoTearOff {
  const _$UserInfoTearOff();

  _UserInfo call(
      {@HiveField(0) required int uid,
      @JsonKey(name: 'username') @HiveField(1) required String userName,
      @HiveField(2) required int pk}) {
    return _UserInfo(
      uid: uid,
      userName: userName,
      pk: pk,
    );
  }

  UserInfo fromJson(Map<String, Object?> json) {
    return UserInfo.fromJson(json);
  }
}

/// @nodoc
const $UserInfo = _$UserInfoTearOff();

/// @nodoc
mixin _$UserInfo {
  @HiveField(0)
  int get uid => throw _privateConstructorUsedError;
  @JsonKey(name: 'username')
  @HiveField(1)
  String get userName => throw _privateConstructorUsedError;
  @HiveField(2)
  int get pk => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInfoCopyWith<UserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoCopyWith<$Res> {
  factory $UserInfoCopyWith(UserInfo value, $Res Function(UserInfo) then) =
      _$UserInfoCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int uid,
      @JsonKey(name: 'username') @HiveField(1) String userName,
      @HiveField(2) int pk});
}

/// @nodoc
class _$UserInfoCopyWithImpl<$Res> implements $UserInfoCopyWith<$Res> {
  _$UserInfoCopyWithImpl(this._value, this._then);

  final UserInfo _value;
  // ignore: unused_field
  final $Res Function(UserInfo) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? userName = freezed,
    Object? pk = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as int,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      pk: pk == freezed
          ? _value.pk
          : pk // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$UserInfoCopyWith<$Res> implements $UserInfoCopyWith<$Res> {
  factory _$UserInfoCopyWith(_UserInfo value, $Res Function(_UserInfo) then) =
      __$UserInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int uid,
      @JsonKey(name: 'username') @HiveField(1) String userName,
      @HiveField(2) int pk});
}

/// @nodoc
class __$UserInfoCopyWithImpl<$Res> extends _$UserInfoCopyWithImpl<$Res>
    implements _$UserInfoCopyWith<$Res> {
  __$UserInfoCopyWithImpl(_UserInfo _value, $Res Function(_UserInfo) _then)
      : super(_value, (v) => _then(v as _UserInfo));

  @override
  _UserInfo get _value => super._value as _UserInfo;

  @override
  $Res call({
    Object? uid = freezed,
    Object? userName = freezed,
    Object? pk = freezed,
  }) {
    return _then(_UserInfo(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as int,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      pk: pk == freezed
          ? _value.pk
          : pk // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1, adapterName: 'UserInfoAdapter')
class _$_UserInfo implements _UserInfo {
  _$_UserInfo(
      {@HiveField(0) required this.uid,
      @JsonKey(name: 'username') @HiveField(1) required this.userName,
      @HiveField(2) required this.pk});

  factory _$_UserInfo.fromJson(Map<String, dynamic> json) =>
      _$$_UserInfoFromJson(json);

  @override
  @HiveField(0)
  final int uid;
  @override
  @JsonKey(name: 'username')
  @HiveField(1)
  final String userName;
  @override
  @HiveField(2)
  final int pk;

  @override
  String toString() {
    return 'UserInfo(uid: $uid, userName: $userName, pk: $pk)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserInfo &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.pk, pk) || other.pk == pk));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid, userName, pk);

  @JsonKey(ignore: true)
  @override
  _$UserInfoCopyWith<_UserInfo> get copyWith =>
      __$UserInfoCopyWithImpl<_UserInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserInfoToJson(this);
  }
}

abstract class _UserInfo implements UserInfo {
  factory _UserInfo(
      {@HiveField(0) required int uid,
      @JsonKey(name: 'username') @HiveField(1) required String userName,
      @HiveField(2) required int pk}) = _$_UserInfo;

  factory _UserInfo.fromJson(Map<String, dynamic> json) = _$_UserInfo.fromJson;

  @override
  @HiveField(0)
  int get uid;
  @override
  @JsonKey(name: 'username')
  @HiveField(1)
  String get userName;
  @override
  @HiveField(2)
  int get pk;
  @override
  @JsonKey(ignore: true)
  _$UserInfoCopyWith<_UserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
