// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShopList _$$_ShopListFromJson(Map<String, dynamic> json) => _$_ShopList(
      shopDatas: (json['shopDatas'] as List<dynamic>)
          .map((e) => ShopData.fromJson(e as Map<String, dynamic>))
          .toList(),
      next: json['next'] as String?,
    );

Map<String, dynamic> _$$_ShopListToJson(_$_ShopList instance) =>
    <String, dynamic>{
      'shopDatas': instance.shopDatas,
      'next': instance.next,
    };
