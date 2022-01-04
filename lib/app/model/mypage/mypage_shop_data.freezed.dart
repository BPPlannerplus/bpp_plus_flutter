// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mypage_shop_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MypageShopData _$MypageShopDataFromJson(Map<String, dynamic> json) {
  return _MypageShopData.fromJson(json);
}

/// @nodoc
class _$MypageShopDataTearOff {
  const _$MypageShopDataTearOff();

  _MypageShopData call(
      {required int id,
      required String name,
      required String logo,
      @JsonKey(name: 'kakaourl') required String kakaoUrl,
      @JsonKey(name: 'shop_type') required int type}) {
    return _MypageShopData(
      id: id,
      name: name,
      logo: logo,
      kakaoUrl: kakaoUrl,
      type: type,
    );
  }

  MypageShopData fromJson(Map<String, Object?> json) {
    return MypageShopData.fromJson(json);
  }
}

/// @nodoc
const $MypageShopData = _$MypageShopDataTearOff();

/// @nodoc
mixin _$MypageShopData {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get logo => throw _privateConstructorUsedError;
  @JsonKey(name: 'kakaourl')
  String get kakaoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'shop_type')
  int get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MypageShopDataCopyWith<MypageShopData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MypageShopDataCopyWith<$Res> {
  factory $MypageShopDataCopyWith(
          MypageShopData value, $Res Function(MypageShopData) then) =
      _$MypageShopDataCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      String logo,
      @JsonKey(name: 'kakaourl') String kakaoUrl,
      @JsonKey(name: 'shop_type') int type});
}

/// @nodoc
class _$MypageShopDataCopyWithImpl<$Res>
    implements $MypageShopDataCopyWith<$Res> {
  _$MypageShopDataCopyWithImpl(this._value, this._then);

  final MypageShopData _value;
  // ignore: unused_field
  final $Res Function(MypageShopData) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? logo = freezed,
    Object? kakaoUrl = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logo: logo == freezed
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      kakaoUrl: kakaoUrl == freezed
          ? _value.kakaoUrl
          : kakaoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$MypageShopDataCopyWith<$Res>
    implements $MypageShopDataCopyWith<$Res> {
  factory _$MypageShopDataCopyWith(
          _MypageShopData value, $Res Function(_MypageShopData) then) =
      __$MypageShopDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      String logo,
      @JsonKey(name: 'kakaourl') String kakaoUrl,
      @JsonKey(name: 'shop_type') int type});
}

/// @nodoc
class __$MypageShopDataCopyWithImpl<$Res>
    extends _$MypageShopDataCopyWithImpl<$Res>
    implements _$MypageShopDataCopyWith<$Res> {
  __$MypageShopDataCopyWithImpl(
      _MypageShopData _value, $Res Function(_MypageShopData) _then)
      : super(_value, (v) => _then(v as _MypageShopData));

  @override
  _MypageShopData get _value => super._value as _MypageShopData;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? logo = freezed,
    Object? kakaoUrl = freezed,
    Object? type = freezed,
  }) {
    return _then(_MypageShopData(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logo: logo == freezed
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      kakaoUrl: kakaoUrl == freezed
          ? _value.kakaoUrl
          : kakaoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MypageShopData implements _MypageShopData {
  _$_MypageShopData(
      {required this.id,
      required this.name,
      required this.logo,
      @JsonKey(name: 'kakaourl') required this.kakaoUrl,
      @JsonKey(name: 'shop_type') required this.type});

  factory _$_MypageShopData.fromJson(Map<String, dynamic> json) =>
      _$$_MypageShopDataFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String logo;
  @override
  @JsonKey(name: 'kakaourl')
  final String kakaoUrl;
  @override
  @JsonKey(name: 'shop_type')
  final int type;

  @override
  String toString() {
    return 'MypageShopData(id: $id, name: $name, logo: $logo, kakaoUrl: $kakaoUrl, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MypageShopData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.kakaoUrl, kakaoUrl) ||
                other.kakaoUrl == kakaoUrl) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, logo, kakaoUrl, type);

  @JsonKey(ignore: true)
  @override
  _$MypageShopDataCopyWith<_MypageShopData> get copyWith =>
      __$MypageShopDataCopyWithImpl<_MypageShopData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MypageShopDataToJson(this);
  }
}

abstract class _MypageShopData implements MypageShopData {
  factory _MypageShopData(
      {required int id,
      required String name,
      required String logo,
      @JsonKey(name: 'kakaourl') required String kakaoUrl,
      @JsonKey(name: 'shop_type') required int type}) = _$_MypageShopData;

  factory _MypageShopData.fromJson(Map<String, dynamic> json) =
      _$_MypageShopData.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get logo;
  @override
  @JsonKey(name: 'kakaourl')
  String get kakaoUrl;
  @override
  @JsonKey(name: 'shop_type')
  int get type;
  @override
  @JsonKey(ignore: true)
  _$MypageShopDataCopyWith<_MypageShopData> get copyWith =>
      throw _privateConstructorUsedError;
}
