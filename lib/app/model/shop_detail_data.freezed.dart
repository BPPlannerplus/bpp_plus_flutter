// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'shop_detail_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShopDetailData _$ShopDetailDataFromJson(Map<String, dynamic> json) {
  return _ShopDetailData.fromJson(json);
}

/// @nodoc
class _$ShopDetailDataTearOff {
  const _$ShopDetailDataTearOff();

  _ShopDetailData call(
      {required int id,
      required String name,
      required String logo,
      required bool like,
      @JsonKey(name: 'kakaourl')
          required String kakaoUrl,
      @JsonKey(name: 'address_detail')
          required String address,
      required List<String> profiles,
      @JsonKey(name: 'map')
          required String mapImg,
      @JsonKey(name: 'minprice')
          required int minPrice,
      @JsonKey(name: 'price_desc')
          required String priceImg,
      @JsonKey(name: 'affiliates')
          required List<PartnershipData> partnershipList}) {
    return _ShopDetailData(
      id: id,
      name: name,
      logo: logo,
      like: like,
      kakaoUrl: kakaoUrl,
      address: address,
      profiles: profiles,
      mapImg: mapImg,
      minPrice: minPrice,
      priceImg: priceImg,
      partnershipList: partnershipList,
    );
  }

  ShopDetailData fromJson(Map<String, Object?> json) {
    return ShopDetailData.fromJson(json);
  }
}

/// @nodoc
const $ShopDetailData = _$ShopDetailDataTearOff();

/// @nodoc
mixin _$ShopDetailData {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get logo => throw _privateConstructorUsedError;
  bool get like => throw _privateConstructorUsedError;
  @JsonKey(name: 'kakaourl')
  String get kakaoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_detail')
  String get address => throw _privateConstructorUsedError;
  List<String> get profiles => throw _privateConstructorUsedError;
  @JsonKey(name: 'map')
  String get mapImg => throw _privateConstructorUsedError;
  @JsonKey(name: 'minprice')
  int get minPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_desc')
  String get priceImg => throw _privateConstructorUsedError;
  @JsonKey(name: 'affiliates')
  List<PartnershipData> get partnershipList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShopDetailDataCopyWith<ShopDetailData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopDetailDataCopyWith<$Res> {
  factory $ShopDetailDataCopyWith(
          ShopDetailData value, $Res Function(ShopDetailData) then) =
      _$ShopDetailDataCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      String logo,
      bool like,
      @JsonKey(name: 'kakaourl') String kakaoUrl,
      @JsonKey(name: 'address_detail') String address,
      List<String> profiles,
      @JsonKey(name: 'map') String mapImg,
      @JsonKey(name: 'minprice') int minPrice,
      @JsonKey(name: 'price_desc') String priceImg,
      @JsonKey(name: 'affiliates') List<PartnershipData> partnershipList});
}

/// @nodoc
class _$ShopDetailDataCopyWithImpl<$Res>
    implements $ShopDetailDataCopyWith<$Res> {
  _$ShopDetailDataCopyWithImpl(this._value, this._then);

  final ShopDetailData _value;
  // ignore: unused_field
  final $Res Function(ShopDetailData) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? logo = freezed,
    Object? like = freezed,
    Object? kakaoUrl = freezed,
    Object? address = freezed,
    Object? profiles = freezed,
    Object? mapImg = freezed,
    Object? minPrice = freezed,
    Object? priceImg = freezed,
    Object? partnershipList = freezed,
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
      like: like == freezed
          ? _value.like
          : like // ignore: cast_nullable_to_non_nullable
              as bool,
      kakaoUrl: kakaoUrl == freezed
          ? _value.kakaoUrl
          : kakaoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      profiles: profiles == freezed
          ? _value.profiles
          : profiles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      mapImg: mapImg == freezed
          ? _value.mapImg
          : mapImg // ignore: cast_nullable_to_non_nullable
              as String,
      minPrice: minPrice == freezed
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as int,
      priceImg: priceImg == freezed
          ? _value.priceImg
          : priceImg // ignore: cast_nullable_to_non_nullable
              as String,
      partnershipList: partnershipList == freezed
          ? _value.partnershipList
          : partnershipList // ignore: cast_nullable_to_non_nullable
              as List<PartnershipData>,
    ));
  }
}

/// @nodoc
abstract class _$ShopDetailDataCopyWith<$Res>
    implements $ShopDetailDataCopyWith<$Res> {
  factory _$ShopDetailDataCopyWith(
          _ShopDetailData value, $Res Function(_ShopDetailData) then) =
      __$ShopDetailDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      String logo,
      bool like,
      @JsonKey(name: 'kakaourl') String kakaoUrl,
      @JsonKey(name: 'address_detail') String address,
      List<String> profiles,
      @JsonKey(name: 'map') String mapImg,
      @JsonKey(name: 'minprice') int minPrice,
      @JsonKey(name: 'price_desc') String priceImg,
      @JsonKey(name: 'affiliates') List<PartnershipData> partnershipList});
}

/// @nodoc
class __$ShopDetailDataCopyWithImpl<$Res>
    extends _$ShopDetailDataCopyWithImpl<$Res>
    implements _$ShopDetailDataCopyWith<$Res> {
  __$ShopDetailDataCopyWithImpl(
      _ShopDetailData _value, $Res Function(_ShopDetailData) _then)
      : super(_value, (v) => _then(v as _ShopDetailData));

  @override
  _ShopDetailData get _value => super._value as _ShopDetailData;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? logo = freezed,
    Object? like = freezed,
    Object? kakaoUrl = freezed,
    Object? address = freezed,
    Object? profiles = freezed,
    Object? mapImg = freezed,
    Object? minPrice = freezed,
    Object? priceImg = freezed,
    Object? partnershipList = freezed,
  }) {
    return _then(_ShopDetailData(
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
      like: like == freezed
          ? _value.like
          : like // ignore: cast_nullable_to_non_nullable
              as bool,
      kakaoUrl: kakaoUrl == freezed
          ? _value.kakaoUrl
          : kakaoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      profiles: profiles == freezed
          ? _value.profiles
          : profiles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      mapImg: mapImg == freezed
          ? _value.mapImg
          : mapImg // ignore: cast_nullable_to_non_nullable
              as String,
      minPrice: minPrice == freezed
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as int,
      priceImg: priceImg == freezed
          ? _value.priceImg
          : priceImg // ignore: cast_nullable_to_non_nullable
              as String,
      partnershipList: partnershipList == freezed
          ? _value.partnershipList
          : partnershipList // ignore: cast_nullable_to_non_nullable
              as List<PartnershipData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShopDetailData implements _ShopDetailData {
  _$_ShopDetailData(
      {required this.id,
      required this.name,
      required this.logo,
      required this.like,
      @JsonKey(name: 'kakaourl') required this.kakaoUrl,
      @JsonKey(name: 'address_detail') required this.address,
      required this.profiles,
      @JsonKey(name: 'map') required this.mapImg,
      @JsonKey(name: 'minprice') required this.minPrice,
      @JsonKey(name: 'price_desc') required this.priceImg,
      @JsonKey(name: 'affiliates') required this.partnershipList});

  factory _$_ShopDetailData.fromJson(Map<String, dynamic> json) =>
      _$$_ShopDetailDataFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String logo;
  @override
  final bool like;
  @override
  @JsonKey(name: 'kakaourl')
  final String kakaoUrl;
  @override
  @JsonKey(name: 'address_detail')
  final String address;
  @override
  final List<String> profiles;
  @override
  @JsonKey(name: 'map')
  final String mapImg;
  @override
  @JsonKey(name: 'minprice')
  final int minPrice;
  @override
  @JsonKey(name: 'price_desc')
  final String priceImg;
  @override
  @JsonKey(name: 'affiliates')
  final List<PartnershipData> partnershipList;

  @override
  String toString() {
    return 'ShopDetailData(id: $id, name: $name, logo: $logo, like: $like, kakaoUrl: $kakaoUrl, address: $address, profiles: $profiles, mapImg: $mapImg, minPrice: $minPrice, priceImg: $priceImg, partnershipList: $partnershipList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShopDetailData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.like, like) || other.like == like) &&
            (identical(other.kakaoUrl, kakaoUrl) ||
                other.kakaoUrl == kakaoUrl) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality().equals(other.profiles, profiles) &&
            (identical(other.mapImg, mapImg) || other.mapImg == mapImg) &&
            (identical(other.minPrice, minPrice) ||
                other.minPrice == minPrice) &&
            (identical(other.priceImg, priceImg) ||
                other.priceImg == priceImg) &&
            const DeepCollectionEquality()
                .equals(other.partnershipList, partnershipList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      logo,
      like,
      kakaoUrl,
      address,
      const DeepCollectionEquality().hash(profiles),
      mapImg,
      minPrice,
      priceImg,
      const DeepCollectionEquality().hash(partnershipList));

  @JsonKey(ignore: true)
  @override
  _$ShopDetailDataCopyWith<_ShopDetailData> get copyWith =>
      __$ShopDetailDataCopyWithImpl<_ShopDetailData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShopDetailDataToJson(this);
  }
}

abstract class _ShopDetailData implements ShopDetailData {
  factory _ShopDetailData(
      {required int id,
      required String name,
      required String logo,
      required bool like,
      @JsonKey(name: 'kakaourl')
          required String kakaoUrl,
      @JsonKey(name: 'address_detail')
          required String address,
      required List<String> profiles,
      @JsonKey(name: 'map')
          required String mapImg,
      @JsonKey(name: 'minprice')
          required int minPrice,
      @JsonKey(name: 'price_desc')
          required String priceImg,
      @JsonKey(name: 'affiliates')
          required List<PartnershipData> partnershipList}) = _$_ShopDetailData;

  factory _ShopDetailData.fromJson(Map<String, dynamic> json) =
      _$_ShopDetailData.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get logo;
  @override
  bool get like;
  @override
  @JsonKey(name: 'kakaourl')
  String get kakaoUrl;
  @override
  @JsonKey(name: 'address_detail')
  String get address;
  @override
  List<String> get profiles;
  @override
  @JsonKey(name: 'map')
  String get mapImg;
  @override
  @JsonKey(name: 'minprice')
  int get minPrice;
  @override
  @JsonKey(name: 'price_desc')
  String get priceImg;
  @override
  @JsonKey(name: 'affiliates')
  List<PartnershipData> get partnershipList;
  @override
  @JsonKey(ignore: true)
  _$ShopDetailDataCopyWith<_ShopDetailData> get copyWith =>
      throw _privateConstructorUsedError;
}

PartnershipData _$PartnershipDataFromJson(Map<String, dynamic> json) {
  return _PartnershipData.fromJson(json);
}

/// @nodoc
class _$PartnershipDataTearOff {
  const _$PartnershipDataTearOff();

  _PartnershipData call(
      {required int id, required String name, required String profile}) {
    return _PartnershipData(
      id: id,
      name: name,
      profile: profile,
    );
  }

  PartnershipData fromJson(Map<String, Object?> json) {
    return PartnershipData.fromJson(json);
  }
}

/// @nodoc
const $PartnershipData = _$PartnershipDataTearOff();

/// @nodoc
mixin _$PartnershipData {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get profile => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PartnershipDataCopyWith<PartnershipData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartnershipDataCopyWith<$Res> {
  factory $PartnershipDataCopyWith(
          PartnershipData value, $Res Function(PartnershipData) then) =
      _$PartnershipDataCopyWithImpl<$Res>;
  $Res call({int id, String name, String profile});
}

/// @nodoc
class _$PartnershipDataCopyWithImpl<$Res>
    implements $PartnershipDataCopyWith<$Res> {
  _$PartnershipDataCopyWithImpl(this._value, this._then);

  final PartnershipData _value;
  // ignore: unused_field
  final $Res Function(PartnershipData) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
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
      profile: profile == freezed
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$PartnershipDataCopyWith<$Res>
    implements $PartnershipDataCopyWith<$Res> {
  factory _$PartnershipDataCopyWith(
          _PartnershipData value, $Res Function(_PartnershipData) then) =
      __$PartnershipDataCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name, String profile});
}

/// @nodoc
class __$PartnershipDataCopyWithImpl<$Res>
    extends _$PartnershipDataCopyWithImpl<$Res>
    implements _$PartnershipDataCopyWith<$Res> {
  __$PartnershipDataCopyWithImpl(
      _PartnershipData _value, $Res Function(_PartnershipData) _then)
      : super(_value, (v) => _then(v as _PartnershipData));

  @override
  _PartnershipData get _value => super._value as _PartnershipData;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? profile = freezed,
  }) {
    return _then(_PartnershipData(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profile: profile == freezed
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PartnershipData implements _PartnershipData {
  _$_PartnershipData(
      {required this.id, required this.name, required this.profile});

  factory _$_PartnershipData.fromJson(Map<String, dynamic> json) =>
      _$$_PartnershipDataFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String profile;

  @override
  String toString() {
    return 'PartnershipData(id: $id, name: $name, profile: $profile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PartnershipData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, profile);

  @JsonKey(ignore: true)
  @override
  _$PartnershipDataCopyWith<_PartnershipData> get copyWith =>
      __$PartnershipDataCopyWithImpl<_PartnershipData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PartnershipDataToJson(this);
  }
}

abstract class _PartnershipData implements PartnershipData {
  factory _PartnershipData(
      {required int id,
      required String name,
      required String profile}) = _$_PartnershipData;

  factory _PartnershipData.fromJson(Map<String, dynamic> json) =
      _$_PartnershipData.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get profile;
  @override
  @JsonKey(ignore: true)
  _$PartnershipDataCopyWith<_PartnershipData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$DetailIndexTearOff {
  const _$DetailIndexTearOff();

  _DetailIndex call({required int shopId, required int index}) {
    return _DetailIndex(
      shopId: shopId,
      index: index,
    );
  }
}

/// @nodoc
const $DetailIndex = _$DetailIndexTearOff();

/// @nodoc
mixin _$DetailIndex {
  int get shopId => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailIndexCopyWith<DetailIndex> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailIndexCopyWith<$Res> {
  factory $DetailIndexCopyWith(
          DetailIndex value, $Res Function(DetailIndex) then) =
      _$DetailIndexCopyWithImpl<$Res>;
  $Res call({int shopId, int index});
}

/// @nodoc
class _$DetailIndexCopyWithImpl<$Res> implements $DetailIndexCopyWith<$Res> {
  _$DetailIndexCopyWithImpl(this._value, this._then);

  final DetailIndex _value;
  // ignore: unused_field
  final $Res Function(DetailIndex) _then;

  @override
  $Res call({
    Object? shopId = freezed,
    Object? index = freezed,
  }) {
    return _then(_value.copyWith(
      shopId: shopId == freezed
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as int,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$DetailIndexCopyWith<$Res>
    implements $DetailIndexCopyWith<$Res> {
  factory _$DetailIndexCopyWith(
          _DetailIndex value, $Res Function(_DetailIndex) then) =
      __$DetailIndexCopyWithImpl<$Res>;
  @override
  $Res call({int shopId, int index});
}

/// @nodoc
class __$DetailIndexCopyWithImpl<$Res> extends _$DetailIndexCopyWithImpl<$Res>
    implements _$DetailIndexCopyWith<$Res> {
  __$DetailIndexCopyWithImpl(
      _DetailIndex _value, $Res Function(_DetailIndex) _then)
      : super(_value, (v) => _then(v as _DetailIndex));

  @override
  _DetailIndex get _value => super._value as _DetailIndex;

  @override
  $Res call({
    Object? shopId = freezed,
    Object? index = freezed,
  }) {
    return _then(_DetailIndex(
      shopId: shopId == freezed
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as int,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_DetailIndex implements _DetailIndex {
  _$_DetailIndex({required this.shopId, required this.index});

  @override
  final int shopId;
  @override
  final int index;

  @override
  String toString() {
    return 'DetailIndex(shopId: $shopId, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DetailIndex &&
            (identical(other.shopId, shopId) || other.shopId == shopId) &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, shopId, index);

  @JsonKey(ignore: true)
  @override
  _$DetailIndexCopyWith<_DetailIndex> get copyWith =>
      __$DetailIndexCopyWithImpl<_DetailIndex>(this, _$identity);
}

abstract class _DetailIndex implements DetailIndex {
  factory _DetailIndex({required int shopId, required int index}) =
      _$_DetailIndex;

  @override
  int get shopId;
  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$DetailIndexCopyWith<_DetailIndex> get copyWith =>
      throw _privateConstructorUsedError;
}
