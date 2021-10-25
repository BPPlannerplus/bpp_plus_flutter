// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LikeRequest _$LikeRequestFromJson(Map<String, dynamic> json) => LikeRequest(
      like: json['change_to_like'] as bool,
    );

Map<String, dynamic> _$LikeRequestToJson(LikeRequest instance) =>
    <String, dynamic>{
      'change_to_like': instance.like,
    };

LikeResponse _$LikeResponseFromJson(Map<String, dynamic> json) => LikeResponse(
      results: json['results'] as String,
    );

Map<String, dynamic> _$LikeResponseToJson(LikeResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
