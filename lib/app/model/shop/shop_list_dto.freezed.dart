// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'shop_list_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ShopListDtoTearOff {
  const _$ShopListDtoTearOff();

  _ShopListDto call(
      {required List<ShopData> shopData,
      required int nextPage,
      required bool hasNext}) {
    return _ShopListDto(
      shopData: shopData,
      nextPage: nextPage,
      hasNext: hasNext,
    );
  }
}

/// @nodoc
const $ShopListDto = _$ShopListDtoTearOff();

/// @nodoc
mixin _$ShopListDto {
  List<ShopData> get shopData => throw _privateConstructorUsedError;
  int get nextPage => throw _privateConstructorUsedError;
  bool get hasNext => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShopListDtoCopyWith<ShopListDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopListDtoCopyWith<$Res> {
  factory $ShopListDtoCopyWith(
          ShopListDto value, $Res Function(ShopListDto) then) =
      _$ShopListDtoCopyWithImpl<$Res>;
  $Res call({List<ShopData> shopData, int nextPage, bool hasNext});
}

/// @nodoc
class _$ShopListDtoCopyWithImpl<$Res> implements $ShopListDtoCopyWith<$Res> {
  _$ShopListDtoCopyWithImpl(this._value, this._then);

  final ShopListDto _value;
  // ignore: unused_field
  final $Res Function(ShopListDto) _then;

  @override
  $Res call({
    Object? shopData = freezed,
    Object? nextPage = freezed,
    Object? hasNext = freezed,
  }) {
    return _then(_value.copyWith(
      shopData: shopData == freezed
          ? _value.shopData
          : shopData // ignore: cast_nullable_to_non_nullable
              as List<ShopData>,
      nextPage: nextPage == freezed
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasNext: hasNext == freezed
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$ShopListDtoCopyWith<$Res>
    implements $ShopListDtoCopyWith<$Res> {
  factory _$ShopListDtoCopyWith(
          _ShopListDto value, $Res Function(_ShopListDto) then) =
      __$ShopListDtoCopyWithImpl<$Res>;
  @override
  $Res call({List<ShopData> shopData, int nextPage, bool hasNext});
}

/// @nodoc
class __$ShopListDtoCopyWithImpl<$Res> extends _$ShopListDtoCopyWithImpl<$Res>
    implements _$ShopListDtoCopyWith<$Res> {
  __$ShopListDtoCopyWithImpl(
      _ShopListDto _value, $Res Function(_ShopListDto) _then)
      : super(_value, (v) => _then(v as _ShopListDto));

  @override
  _ShopListDto get _value => super._value as _ShopListDto;

  @override
  $Res call({
    Object? shopData = freezed,
    Object? nextPage = freezed,
    Object? hasNext = freezed,
  }) {
    return _then(_ShopListDto(
      shopData: shopData == freezed
          ? _value.shopData
          : shopData // ignore: cast_nullable_to_non_nullable
              as List<ShopData>,
      nextPage: nextPage == freezed
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasNext: hasNext == freezed
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ShopListDto implements _ShopListDto {
  _$_ShopListDto(
      {required this.shopData, required this.nextPage, required this.hasNext});

  @override
  final List<ShopData> shopData;
  @override
  final int nextPage;
  @override
  final bool hasNext;

  @override
  String toString() {
    return 'ShopListDto(shopData: $shopData, nextPage: $nextPage, hasNext: $hasNext)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShopListDto &&
            const DeepCollectionEquality().equals(other.shopData, shopData) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage) &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(shopData), nextPage, hasNext);

  @JsonKey(ignore: true)
  @override
  _$ShopListDtoCopyWith<_ShopListDto> get copyWith =>
      __$ShopListDtoCopyWithImpl<_ShopListDto>(this, _$identity);
}

abstract class _ShopListDto implements ShopListDto {
  factory _ShopListDto(
      {required List<ShopData> shopData,
      required int nextPage,
      required bool hasNext}) = _$_ShopListDto;

  @override
  List<ShopData> get shopData;
  @override
  int get nextPage;
  @override
  bool get hasNext;
  @override
  @JsonKey(ignore: true)
  _$ShopListDtoCopyWith<_ShopListDto> get copyWith =>
      throw _privateConstructorUsedError;
}
