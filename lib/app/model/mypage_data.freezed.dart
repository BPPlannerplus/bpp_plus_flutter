// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mypage_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MypageData _$MypageDataFromJson(Map<String, dynamic> json) {
  return _MypageData.fromJson(json);
}

/// @nodoc
class _$MypageDataTearOff {
  const _$MypageDataTearOff();

  _MypageData call(
      {required int id,
      required int state,
      required MypageShopData shop,
      @JsonKey(name: 'reserved_date') required String reservedData}) {
    return _MypageData(
      id: id,
      state: state,
      shop: shop,
      reservedData: reservedData,
    );
  }

  MypageData fromJson(Map<String, Object?> json) {
    return MypageData.fromJson(json);
  }
}

/// @nodoc
const $MypageData = _$MypageDataTearOff();

/// @nodoc
mixin _$MypageData {
  int get id => throw _privateConstructorUsedError;
  int get state => throw _privateConstructorUsedError;
  MypageShopData get shop => throw _privateConstructorUsedError;
  @JsonKey(name: 'reserved_date')
  String get reservedData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MypageDataCopyWith<MypageData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MypageDataCopyWith<$Res> {
  factory $MypageDataCopyWith(
          MypageData value, $Res Function(MypageData) then) =
      _$MypageDataCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int state,
      MypageShopData shop,
      @JsonKey(name: 'reserved_date') String reservedData});

  $MypageShopDataCopyWith<$Res> get shop;
}

/// @nodoc
class _$MypageDataCopyWithImpl<$Res> implements $MypageDataCopyWith<$Res> {
  _$MypageDataCopyWithImpl(this._value, this._then);

  final MypageData _value;
  // ignore: unused_field
  final $Res Function(MypageData) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? state = freezed,
    Object? shop = freezed,
    Object? reservedData = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as int,
      shop: shop == freezed
          ? _value.shop
          : shop // ignore: cast_nullable_to_non_nullable
              as MypageShopData,
      reservedData: reservedData == freezed
          ? _value.reservedData
          : reservedData // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $MypageShopDataCopyWith<$Res> get shop {
    return $MypageShopDataCopyWith<$Res>(_value.shop, (value) {
      return _then(_value.copyWith(shop: value));
    });
  }
}

/// @nodoc
abstract class _$MypageDataCopyWith<$Res> implements $MypageDataCopyWith<$Res> {
  factory _$MypageDataCopyWith(
          _MypageData value, $Res Function(_MypageData) then) =
      __$MypageDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int state,
      MypageShopData shop,
      @JsonKey(name: 'reserved_date') String reservedData});

  @override
  $MypageShopDataCopyWith<$Res> get shop;
}

/// @nodoc
class __$MypageDataCopyWithImpl<$Res> extends _$MypageDataCopyWithImpl<$Res>
    implements _$MypageDataCopyWith<$Res> {
  __$MypageDataCopyWithImpl(
      _MypageData _value, $Res Function(_MypageData) _then)
      : super(_value, (v) => _then(v as _MypageData));

  @override
  _MypageData get _value => super._value as _MypageData;

  @override
  $Res call({
    Object? id = freezed,
    Object? state = freezed,
    Object? shop = freezed,
    Object? reservedData = freezed,
  }) {
    return _then(_MypageData(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as int,
      shop: shop == freezed
          ? _value.shop
          : shop // ignore: cast_nullable_to_non_nullable
              as MypageShopData,
      reservedData: reservedData == freezed
          ? _value.reservedData
          : reservedData // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MypageData implements _MypageData {
  _$_MypageData(
      {required this.id,
      required this.state,
      required this.shop,
      @JsonKey(name: 'reserved_date') required this.reservedData});

  factory _$_MypageData.fromJson(Map<String, dynamic> json) =>
      _$$_MypageDataFromJson(json);

  @override
  final int id;
  @override
  final int state;
  @override
  final MypageShopData shop;
  @override
  @JsonKey(name: 'reserved_date')
  final String reservedData;

  @override
  String toString() {
    return 'MypageData(id: $id, state: $state, shop: $shop, reservedData: $reservedData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MypageData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.shop, shop) || other.shop == shop) &&
            (identical(other.reservedData, reservedData) ||
                other.reservedData == reservedData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, state, shop, reservedData);

  @JsonKey(ignore: true)
  @override
  _$MypageDataCopyWith<_MypageData> get copyWith =>
      __$MypageDataCopyWithImpl<_MypageData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MypageDataToJson(this);
  }
}

abstract class _MypageData implements MypageData {
  factory _MypageData(
          {required int id,
          required int state,
          required MypageShopData shop,
          @JsonKey(name: 'reserved_date') required String reservedData}) =
      _$_MypageData;

  factory _MypageData.fromJson(Map<String, dynamic> json) =
      _$_MypageData.fromJson;

  @override
  int get id;
  @override
  int get state;
  @override
  MypageShopData get shop;
  @override
  @JsonKey(name: 'reserved_date')
  String get reservedData;
  @override
  @JsonKey(ignore: true)
  _$MypageDataCopyWith<_MypageData> get copyWith =>
      throw _privateConstructorUsedError;
}
