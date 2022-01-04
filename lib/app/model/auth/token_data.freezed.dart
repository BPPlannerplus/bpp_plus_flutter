// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'token_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TokenData _$TokenDataFromJson(Map<String, dynamic> json) {
  return _TokenData.fromJson(json);
}

/// @nodoc
class _$TokenDataTearOff {
  const _$TokenDataTearOff();

  _TokenData call(
      {@JsonKey(name: 'access_token') required String accessToken,
      @JsonKey(name: 'refresh_token') String? refreshToken}) {
    return _TokenData(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }

  TokenData fromJson(Map<String, Object?> json) {
    return TokenData.fromJson(json);
  }
}

/// @nodoc
const $TokenData = _$TokenDataTearOff();

/// @nodoc
mixin _$TokenData {
  @JsonKey(name: 'access_token')
  String get accessToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'refresh_token')
  String? get refreshToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokenDataCopyWith<TokenData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenDataCopyWith<$Res> {
  factory $TokenDataCopyWith(TokenData value, $Res Function(TokenData) then) =
      _$TokenDataCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'access_token') String accessToken,
      @JsonKey(name: 'refresh_token') String? refreshToken});
}

/// @nodoc
class _$TokenDataCopyWithImpl<$Res> implements $TokenDataCopyWith<$Res> {
  _$TokenDataCopyWithImpl(this._value, this._then);

  final TokenData _value;
  // ignore: unused_field
  final $Res Function(TokenData) _then;

  @override
  $Res call({
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_value.copyWith(
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$TokenDataCopyWith<$Res> implements $TokenDataCopyWith<$Res> {
  factory _$TokenDataCopyWith(
          _TokenData value, $Res Function(_TokenData) then) =
      __$TokenDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'access_token') String accessToken,
      @JsonKey(name: 'refresh_token') String? refreshToken});
}

/// @nodoc
class __$TokenDataCopyWithImpl<$Res> extends _$TokenDataCopyWithImpl<$Res>
    implements _$TokenDataCopyWith<$Res> {
  __$TokenDataCopyWithImpl(_TokenData _value, $Res Function(_TokenData) _then)
      : super(_value, (v) => _then(v as _TokenData));

  @override
  _TokenData get _value => super._value as _TokenData;

  @override
  $Res call({
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_TokenData(
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TokenData implements _TokenData {
  _$_TokenData(
      {@JsonKey(name: 'access_token') required this.accessToken,
      @JsonKey(name: 'refresh_token') this.refreshToken});

  factory _$_TokenData.fromJson(Map<String, dynamic> json) =>
      _$$_TokenDataFromJson(json);

  @override
  @JsonKey(name: 'access_token')
  final String accessToken;
  @override
  @JsonKey(name: 'refresh_token')
  final String? refreshToken;

  @override
  String toString() {
    return 'TokenData(accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TokenData &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken);

  @JsonKey(ignore: true)
  @override
  _$TokenDataCopyWith<_TokenData> get copyWith =>
      __$TokenDataCopyWithImpl<_TokenData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TokenDataToJson(this);
  }
}

abstract class _TokenData implements TokenData {
  factory _TokenData(
      {@JsonKey(name: 'access_token') required String accessToken,
      @JsonKey(name: 'refresh_token') String? refreshToken}) = _$_TokenData;

  factory _TokenData.fromJson(Map<String, dynamic> json) =
      _$_TokenData.fromJson;

  @override
  @JsonKey(name: 'access_token')
  String get accessToken;
  @override
  @JsonKey(name: 'refresh_token')
  String? get refreshToken;
  @override
  @JsonKey(ignore: true)
  _$TokenDataCopyWith<_TokenData> get copyWith =>
      throw _privateConstructorUsedError;
}

TokenRequest _$TokenRequestFromJson(Map<String, dynamic> json) {
  return _TokenRequest.fromJson(json);
}

/// @nodoc
class _$TokenRequestTearOff {
  const _$TokenRequestTearOff();

  _TokenRequest call(
      {@JsonKey(name: 'user_id') required int userId,
      @JsonKey(name: 'refresh_token') required String refreshToken}) {
    return _TokenRequest(
      userId: userId,
      refreshToken: refreshToken,
    );
  }

  TokenRequest fromJson(Map<String, Object?> json) {
    return TokenRequest.fromJson(json);
  }
}

/// @nodoc
const $TokenRequest = _$TokenRequestTearOff();

/// @nodoc
mixin _$TokenRequest {
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'refresh_token')
  String get refreshToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokenRequestCopyWith<TokenRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenRequestCopyWith<$Res> {
  factory $TokenRequestCopyWith(
          TokenRequest value, $Res Function(TokenRequest) then) =
      _$TokenRequestCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'refresh_token') String refreshToken});
}

/// @nodoc
class _$TokenRequestCopyWithImpl<$Res> implements $TokenRequestCopyWith<$Res> {
  _$TokenRequestCopyWithImpl(this._value, this._then);

  final TokenRequest _value;
  // ignore: unused_field
  final $Res Function(TokenRequest) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$TokenRequestCopyWith<$Res>
    implements $TokenRequestCopyWith<$Res> {
  factory _$TokenRequestCopyWith(
          _TokenRequest value, $Res Function(_TokenRequest) then) =
      __$TokenRequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'refresh_token') String refreshToken});
}

/// @nodoc
class __$TokenRequestCopyWithImpl<$Res> extends _$TokenRequestCopyWithImpl<$Res>
    implements _$TokenRequestCopyWith<$Res> {
  __$TokenRequestCopyWithImpl(
      _TokenRequest _value, $Res Function(_TokenRequest) _then)
      : super(_value, (v) => _then(v as _TokenRequest));

  @override
  _TokenRequest get _value => super._value as _TokenRequest;

  @override
  $Res call({
    Object? userId = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_TokenRequest(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TokenRequest implements _TokenRequest {
  _$_TokenRequest(
      {@JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'refresh_token') required this.refreshToken});

  factory _$_TokenRequest.fromJson(Map<String, dynamic> json) =>
      _$$_TokenRequestFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  @override
  String toString() {
    return 'TokenRequest(userId: $userId, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TokenRequest &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, refreshToken);

  @JsonKey(ignore: true)
  @override
  _$TokenRequestCopyWith<_TokenRequest> get copyWith =>
      __$TokenRequestCopyWithImpl<_TokenRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TokenRequestToJson(this);
  }
}

abstract class _TokenRequest implements TokenRequest {
  factory _TokenRequest(
          {@JsonKey(name: 'user_id') required int userId,
          @JsonKey(name: 'refresh_token') required String refreshToken}) =
      _$_TokenRequest;

  factory _TokenRequest.fromJson(Map<String, dynamic> json) =
      _$_TokenRequest.fromJson;

  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'refresh_token')
  String get refreshToken;
  @override
  @JsonKey(ignore: true)
  _$TokenRequestCopyWith<_TokenRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) {
  return _LoginRequest.fromJson(json);
}

/// @nodoc
class _$LoginRequestTearOff {
  const _$LoginRequestTearOff();

  _LoginRequest call(
      {@JsonKey(name: 'access_token') required String accessToken}) {
    return _LoginRequest(
      accessToken: accessToken,
    );
  }

  LoginRequest fromJson(Map<String, Object?> json) {
    return LoginRequest.fromJson(json);
  }
}

/// @nodoc
const $LoginRequest = _$LoginRequestTearOff();

/// @nodoc
mixin _$LoginRequest {
  @JsonKey(name: 'access_token')
  String get accessToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginRequestCopyWith<LoginRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginRequestCopyWith<$Res> {
  factory $LoginRequestCopyWith(
          LoginRequest value, $Res Function(LoginRequest) then) =
      _$LoginRequestCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'access_token') String accessToken});
}

/// @nodoc
class _$LoginRequestCopyWithImpl<$Res> implements $LoginRequestCopyWith<$Res> {
  _$LoginRequestCopyWithImpl(this._value, this._then);

  final LoginRequest _value;
  // ignore: unused_field
  final $Res Function(LoginRequest) _then;

  @override
  $Res call({
    Object? accessToken = freezed,
  }) {
    return _then(_value.copyWith(
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$LoginRequestCopyWith<$Res>
    implements $LoginRequestCopyWith<$Res> {
  factory _$LoginRequestCopyWith(
          _LoginRequest value, $Res Function(_LoginRequest) then) =
      __$LoginRequestCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'access_token') String accessToken});
}

/// @nodoc
class __$LoginRequestCopyWithImpl<$Res> extends _$LoginRequestCopyWithImpl<$Res>
    implements _$LoginRequestCopyWith<$Res> {
  __$LoginRequestCopyWithImpl(
      _LoginRequest _value, $Res Function(_LoginRequest) _then)
      : super(_value, (v) => _then(v as _LoginRequest));

  @override
  _LoginRequest get _value => super._value as _LoginRequest;

  @override
  $Res call({
    Object? accessToken = freezed,
  }) {
    return _then(_LoginRequest(
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoginRequest implements _LoginRequest {
  _$_LoginRequest({@JsonKey(name: 'access_token') required this.accessToken});

  factory _$_LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$$_LoginRequestFromJson(json);

  @override
  @JsonKey(name: 'access_token')
  final String accessToken;

  @override
  String toString() {
    return 'LoginRequest(accessToken: $accessToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginRequest &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accessToken);

  @JsonKey(ignore: true)
  @override
  _$LoginRequestCopyWith<_LoginRequest> get copyWith =>
      __$LoginRequestCopyWithImpl<_LoginRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginRequestToJson(this);
  }
}

abstract class _LoginRequest implements LoginRequest {
  factory _LoginRequest(
          {@JsonKey(name: 'access_token') required String accessToken}) =
      _$_LoginRequest;

  factory _LoginRequest.fromJson(Map<String, dynamic> json) =
      _$_LoginRequest.fromJson;

  @override
  @JsonKey(name: 'access_token')
  String get accessToken;
  @override
  @JsonKey(ignore: true)
  _$LoginRequestCopyWith<_LoginRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
