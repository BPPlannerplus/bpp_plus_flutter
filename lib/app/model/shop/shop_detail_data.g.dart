// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_detail_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShopDetailData _$$_ShopDetailDataFromJson(Map<String, dynamic> json) =>
    _$_ShopDetailData(
      id: json['id'] as int,
      name: json['name'] as String,
      logo: json['logo'] as String,
      like: json['like'] as bool,
      kakaoUrl: json['kakaourl'] as String,
      address: json['address_detail'] as String,
      profiles:
          (json['profiles'] as List<dynamic>).map((e) => e as String).toList(),
      mapImg: json['map'] as String,
      minPrice: json['minprice'] as int?,
      priceImg: json['price_desc'] as String?,
      priceImaExtra: json['price_decs_extra'] as String?,
      partnershipList: (json['affiliates'] as List<dynamic>?)
          ?.map((e) => PartnershipData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ShopDetailDataToJson(_$_ShopDetailData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'like': instance.like,
      'kakaourl': instance.kakaoUrl,
      'address_detail': instance.address,
      'profiles': instance.profiles,
      'map': instance.mapImg,
      'minprice': instance.minPrice,
      'price_desc': instance.priceImg,
      'price_decs_extra': instance.priceImaExtra,
      'affiliates': instance.partnershipList,
    };

_$_PartnershipData _$$_PartnershipDataFromJson(Map<String, dynamic> json) =>
    _$_PartnershipData(
      id: json['id'] as int,
      name: json['name'] as String,
      profile: json['profile'] as String,
    );

Map<String, dynamic> _$$_PartnershipDataToJson(_$_PartnershipData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profile': instance.profile,
    };
