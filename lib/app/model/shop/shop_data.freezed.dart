// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'shop_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShopData _$ShopDataFromJson(Map<String, dynamic> json) {
  return _ShopData.fromJson(json);
}

/// @nodoc
class _$ShopDataTearOff {
  const _$ShopDataTearOff();

  _ShopData call(
      {required int id,
      required String name,
      required String address,
      required bool like,
      @JsonKey(name: 'minprice') int? minPrice,
      required String profile}) {
    return _ShopData(
      id: id,
      name: name,
      address: address,
      like: like,
      minPrice: minPrice,
      profile: profile,
    );
  }

  ShopData fromJson(Map<String, Object?> json) {
    return ShopData.fromJson(json);
  }
}

/// @nodoc
const $ShopData = _$ShopDataTearOff();

/// @nodoc
mixin _$ShopData {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  bool get like => throw _privateConstructorUsedError;
  @JsonKey(name: 'minprice')
  int? get minPrice => throw _privateConstructorUsedError;
  String get profile => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShopDataCopyWith<ShopData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopDataCopyWith<$Res> {
  factory $ShopDataCopyWith(ShopData value, $Res Function(ShopData) then) =
      _$ShopDataCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      String address,
      bool like,
      @JsonKey(name: 'minprice') int? minPrice,
      String profile});
}

/// @nodoc
class _$ShopDataCopyWithImpl<$Res> implements $ShopDataCopyWith<$Res> {
  _$ShopDataCopyWithImpl(this._value, this._then);

  final ShopData _value;
  // ignore: unused_field
  final $Res Function(ShopData) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? like = freezed,
    Object? minPrice = freezed,
    Object? profile = freezed,
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
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      like: like == freezed
          ? _value.like
          : like // ignore: cast_nullable_to_non_nullable
              as bool,
      minPrice: minPrice == freezed
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      profile: profile == freezed
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ShopDataCopyWith<$Res> implements $ShopDataCopyWith<$Res> {
  factory _$ShopDataCopyWith(_ShopData value, $Res Function(_ShopData) then) =
      __$ShopDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      String address,
      bool like,
      @JsonKey(name: 'minprice') int? minPrice,
      String profile});
}

/// @nodoc
class __$ShopDataCopyWithImpl<$Res> extends _$ShopDataCopyWithImpl<$Res>
    implements _$ShopDataCopyWith<$Res> {
  __$ShopDataCopyWithImpl(_ShopData _value, $Res Function(_ShopData) _then)
      : super(_value, (v) => _then(v as _ShopData));

  @override
  _ShopData get _value => super._value as _ShopData;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? like = freezed,
    Object? minPrice = freezed,
    Object? profile = freezed,
  }) {
    return _then(_ShopData(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      like: like == freezed
          ? _value.like
          : like // ignore: cast_nullable_to_non_nullable
              as bool,
      minPrice: minPrice == freezed
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      profile: profile == freezed
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShopData implements _ShopData {
  _$_ShopData(
      {required this.id,
      required this.name,
      required this.address,
      required this.like,
      @JsonKey(name: 'minprice') this.minPrice,
      required this.profile});

  factory _$_ShopData.fromJson(Map<String, dynamic> json) =>
      _$$_ShopDataFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String address;
  @override
  final bool like;
  @override
  @JsonKey(name: 'minprice')
  final int? minPrice;
  @override
  final String profile;

  @override
  String toString() {
    return 'ShopData(id: $id, name: $name, address: $address, like: $like, minPrice: $minPrice, profile: $profile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShopData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.like, like) || other.like == like) &&
            (identical(other.minPrice, minPrice) ||
                other.minPrice == minPrice) &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, address, like, minPrice, profile);

  @JsonKey(ignore: true)
  @override
  _$ShopDataCopyWith<_ShopData> get copyWith =>
      __$ShopDataCopyWithImpl<_ShopData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShopDataToJson(this);
  }
}

abstract class _ShopData implements ShopData {
  factory _ShopData(
      {required int id,
      required String name,
      required String address,
      required bool like,
      @JsonKey(name: 'minprice') int? minPrice,
      required String profile}) = _$_ShopData;

  factory _ShopData.fromJson(Map<String, dynamic> json) = _$_ShopData.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get address;
  @override
  bool get like;
  @override
  @JsonKey(name: 'minprice')
  int? get minPrice;
  @override
  String get profile;
  @override
  @JsonKey(ignore: true)
  _$ShopDataCopyWith<_ShopData> get copyWith =>
      throw _privateConstructorUsedError;
}
