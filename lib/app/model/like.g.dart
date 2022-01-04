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
