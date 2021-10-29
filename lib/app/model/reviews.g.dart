// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Reviews _$$_ReviewsFromJson(Map<String, dynamic> json) => _$_Reviews(
      reviews: (json['reviews'] as List<dynamic>)
          .map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
      next: json['next'] as String,
    );

Map<String, dynamic> _$$_ReviewsToJson(_$_Reviews instance) =>
    <String, dynamic>{
      'reviews': instance.reviews,
      'next': instance.next,
    };
