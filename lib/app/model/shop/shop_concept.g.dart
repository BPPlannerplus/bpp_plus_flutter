// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_concept.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShopConcepts _$$_ShopConceptsFromJson(Map<String, dynamic> json) =>
    _$_ShopConcepts(
      shopConcepts: (json['shopConcepts'] as List<dynamic>)
          .map((e) => ShopConcept.fromJson(e as Map<String, dynamic>))
          .toList(),
      next: json['next'] as String?,
    );

Map<String, dynamic> _$$_ShopConceptsToJson(_$_ShopConcepts instance) =>
    <String, dynamic>{
      'shopConcepts': instance.shopConcepts,
      'next': instance.next,
    };

_$_ShopConcept _$$_ShopConceptFromJson(Map<String, dynamic> json) =>
    _$_ShopConcept(
      id: json['id'] as int,
      profile: json['profile'] as String,
    );

Map<String, dynamic> _$$_ShopConceptToJson(_$_ShopConcept instance) =>
    <String, dynamic>{
      'id': instance.id,
      'profile': instance.profile,
    };
