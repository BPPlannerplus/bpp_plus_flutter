// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'concept.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Concept _$$_ConceptFromJson(Map<String, dynamic> json) => _$_Concept(
      id: json['id'] as int,
      profile: json['profile'] as String,
      shop: IdNamePair.fromJson(json['shop'] as Map<String, dynamic>),
      like: json['like'] as bool,
    );

Map<String, dynamic> _$$_ConceptToJson(_$_Concept instance) =>
    <String, dynamic>{
      'id': instance.id,
      'profile': instance.profile,
      'shop': instance.shop,
      'like': instance.like,
    };

_$_IdNamePair _$$_IdNamePairFromJson(Map<String, dynamic> json) =>
    _$_IdNamePair(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$_IdNamePairToJson(_$_IdNamePair instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
