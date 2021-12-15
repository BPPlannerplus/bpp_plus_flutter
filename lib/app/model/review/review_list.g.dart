// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReviewList _$$_ReviewListFromJson(Map<String, dynamic> json) =>
    _$_ReviewList(
      count: json['count'] as int,
      reviews: (json['results'] as List<dynamic>)
          .map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ReviewListToJson(_$_ReviewList instance) =>
    <String, dynamic>{
      'count': instance.count,
      'results': instance.reviews,
    };
