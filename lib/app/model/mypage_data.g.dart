// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mypage_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MypageData _$$_MypageDataFromJson(Map<String, dynamic> json) =>
    _$_MypageData(
      id: json['id'] as int,
      state: json['state'] as int,
      shop: MypageShopData.fromJson(json['shop'] as Map<String, dynamic>),
      reservedData: json['reserved_date'] as String,
    );

Map<String, dynamic> _$$_MypageDataToJson(_$_MypageData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'state': instance.state,
      'shop': instance.shop,
      'reserved_date': instance.reservedData,
    };
