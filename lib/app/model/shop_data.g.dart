// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShopData _$$_ShopDataFromJson(Map<String, dynamic> json) => _$_ShopData(
      id: json['id'] as int,
      name: json['name'] as String,
      address: json['address'] as String,
      like: json['like'] as bool,
      minPrice: json['minprice'] as int,
      profile: json['profile'] as String,
    );

Map<String, dynamic> _$$_ShopDataToJson(_$_ShopData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'like': instance.like,
      'minprice': instance.minPrice,
      'profile': instance.profile,
    };
