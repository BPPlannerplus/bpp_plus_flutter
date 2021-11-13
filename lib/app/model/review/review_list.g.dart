// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReviewList _$$_ReviewListFromJson(Map<String, dynamic> json) =>
    _$_ReviewList(
      reviews: (json['results'] as List<dynamic>)
          .map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
      next: json['next'] as String?,
    );

Map<String, dynamic> _$$_ReviewListToJson(_$_ReviewList instance) =>
    <String, dynamic>{
      'results': instance.reviews,
      'next': instance.next,
    };
