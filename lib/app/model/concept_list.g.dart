// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'concept_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ConceptList _$$_ConceptListFromJson(Map<String, dynamic> json) =>
    _$_ConceptList(
      concepts: (json['concepts'] as List<dynamic>)
          .map((e) => Concept.fromJson(e as Map<String, dynamic>))
          .toList(),
      next: json['next'] as String?,
    );

Map<String, dynamic> _$$_ConceptListToJson(_$_ConceptList instance) =>
    <String, dynamic>{
      'concepts': instance.concepts,
      'next': instance.next,
    };
