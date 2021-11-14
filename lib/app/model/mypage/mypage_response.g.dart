// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mypage_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MypageResponse _$$_MypageResponseFromJson(Map<String, dynamic> json) =>
    _$_MypageResponse(
      remainingDays: json['remaining_days'] as int?,
      list: (json['results'] as List<dynamic>)
          .map((e) => MypageData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MypageResponseToJson(_$_MypageResponse instance) =>
    <String, dynamic>{
      'remaining_days': instance.remainingDays,
      'results': instance.list,
    };
