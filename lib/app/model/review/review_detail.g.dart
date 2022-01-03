// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReviewDetail _$$_ReviewDetailFromJson(Map<String, dynamic> json) =>
    _$_ReviewDetail(
      id: json['id'] as int,
      createdAt: json['created_at'] as String,
      updatedDt: json['updated_at'] as String,
      score: json['score'] as int,
      contents: json['contents'] as String?,
      date: json['date'] as String,
      editable: json['editable'] as bool,
    );

Map<String, dynamic> _$$_ReviewDetailToJson(_$_ReviewDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedDt,
      'score': instance.score,
      'contents': instance.contents,
      'date': instance.date,
      'editable': instance.editable,
    };

_$_ReviewContent _$$_ReviewContentFromJson(Map<String, dynamic> json) =>
    _$_ReviewContent(
      contents: json['contents'] as String,
    );

Map<String, dynamic> _$$_ReviewContentToJson(_$_ReviewContent instance) =>
    <String, dynamic>{
      'contents': instance.contents,
    };
