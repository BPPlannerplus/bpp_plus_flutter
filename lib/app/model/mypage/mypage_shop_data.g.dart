// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mypage_shop_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MypageShopData _$$_MypageShopDataFromJson(Map<String, dynamic> json) =>
    _$_MypageShopData(
      id: json['id'] as int,
      name: json['name'] as String,
      logo: json['logo'] as String,
      kakaoUrl: json['kakaourl'] as String,
      type: json['shop_type'] as int,
    );

Map<String, dynamic> _$$_MypageShopDataToJson(_$_MypageShopData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'kakaourl': instance.kakaoUrl,
      'shop_type': instance.type,
    };
