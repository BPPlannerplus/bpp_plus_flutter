// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'shop_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShopList _$ShopListFromJson(Map<String, dynamic> json) {
  return _ShopList.fromJson(json);
}

/// @nodoc
class _$ShopListTearOff {
  const _$ShopListTearOff();

  _ShopList call({required List<ShopData> shopDatas, String? next}) {
    return _ShopList(
      shopDatas: shopDatas,
      next: next,
    );
  }

  ShopList fromJson(Map<String, Object?> json) {
    return ShopList.fromJson(json);
  }
}

/// @nodoc
const $ShopList = _$ShopListTearOff();

/// @nodoc
mixin _$ShopList {
  List<ShopData> get shopDatas => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShopListCopyWith<ShopList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopListCopyWith<$Res> {
  factory $ShopListCopyWith(ShopList value, $Res Function(ShopList) then) =
      _$ShopListCopyWithImpl<$Res>;
  $Res call({List<ShopData> shopDatas, String? next});
}

/// @nodoc
class _$ShopListCopyWithImpl<$Res> implements $ShopListCopyWith<$Res> {
  _$ShopListCopyWithImpl(this._value, this._then);

  final ShopList _value;
  // ignore: unused_field
  final $Res Function(ShopList) _then;

  @override
  $Res call({
    Object? shopDatas = freezed,
    Object? next = freezed,
  }) {
    return _then(_value.copyWith(
      shopDatas: shopDatas == freezed
          ? _value.shopDatas
          : shopDatas // ignore: cast_nullable_to_non_nullable
              as List<ShopData>,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ShopListCopyWith<$Res> implements $ShopListCopyWith<$Res> {
  factory _$ShopListCopyWith(_ShopList value, $Res Function(_ShopList) then) =
      __$ShopListCopyWithImpl<$Res>;
  @override
  $Res call({List<ShopData> shopDatas, String? next});
}

/// @nodoc
class __$ShopListCopyWithImpl<$Res> extends _$ShopListCopyWithImpl<$Res>
    implements _$ShopListCopyWith<$Res> {
  __$ShopListCopyWithImpl(_ShopList _value, $Res Function(_ShopList) _then)
      : super(_value, (v) => _then(v as _ShopList));

  @override
  _ShopList get _value => super._value as _ShopList;

  @override
  $Res call({
    Object? shopDatas = freezed,
    Object? next = freezed,
  }) {
    return _then(_ShopList(
      shopDatas: shopDatas == freezed
          ? _value.shopDatas
          : shopDatas // ignore: cast_nullable_to_non_nullable
              as List<ShopData>,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShopList implements _ShopList {
  _$_ShopList({required this.shopDatas, this.next});

  factory _$_ShopList.fromJson(Map<String, dynamic> json) =>
      _$$_ShopListFromJson(json);

  @override
  final List<ShopData> shopDatas;
  @override
  final String? next;

  @override
  String toString() {
    return 'ShopList(shopDatas: $shopDatas, next: $next)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShopList &&
            const DeepCollectionEquality().equals(other.shopDatas, shopDatas) &&
            (identical(other.next, next) || other.next == next));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(shopDatas), next);

  @JsonKey(ignore: true)
  @override
  _$ShopListCopyWith<_ShopList> get copyWith =>
      __$ShopListCopyWithImpl<_ShopList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShopListToJson(this);
  }
}

abstract class _ShopList implements ShopList {
  factory _ShopList({required List<ShopData> shopDatas, String? next}) =
      _$_ShopList;

  factory _ShopList.fromJson(Map<String, dynamic> json) = _$_ShopList.fromJson;

  @override
  List<ShopData> get shopDatas;
  @override
  String? get next;
  @override
  @JsonKey(ignore: true)
  _$ShopListCopyWith<_ShopList> get copyWith =>
      throw _privateConstructorUsedError;
}
