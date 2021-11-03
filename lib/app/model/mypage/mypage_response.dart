// ignore_for_file: invalid_annotation_target

import 'package:bpp_riverpod/app/model/mypage/mypage_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mypage_response.g.dart';
part 'mypage_response.freezed.dart';

@freezed
class MypageResponse with _$MypageResponse {
  factory MypageResponse({
    @JsonKey(name: 'remaining_days') required int remainingDays,
    @JsonKey(name: 'results') required List<MypageData> list,
  }) = _MypageResponse;

  factory MypageResponse.fromJson(Map<String, dynamic> json) =>
      _$MypageResponseFromJson(json);
}
