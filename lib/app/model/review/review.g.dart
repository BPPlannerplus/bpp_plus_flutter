// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Review _$$_ReviewFromJson(Map<String, dynamic> json) => _$_Review(
      id: json['id'] as int,
      userName: json['reserved_user'] as String,
      score: json['score'] as int,
      contents: json['contents'] as String?,
      date: json['date'] as String,
    );

Map<String, dynamic> _$$_ReviewToJson(_$_Review instance) => <String, dynamic>{
      'id': instance.id,
      'reserved_user': instance.userName,
      'score': instance.score,
      'contents': instance.contents,
      'date': instance.date,
    };

_$_ReviewRequest _$$_ReviewRequestFromJson(Map<String, dynamic> json) =>
    _$_ReviewRequest(
      score: json['score'] as int?,
      contents: json['contents'] as String?,
    );

Map<String, dynamic> _$$_ReviewRequestToJson(_$_ReviewRequest instance) =>
    <String, dynamic>{
      'score': instance.score,
      'contents': instance.contents,
    };
