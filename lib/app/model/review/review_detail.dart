// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_detail.freezed.dart';
part 'review_detail.g.dart';

@freezed
class ReviewDetail with _$ReviewDetail {
  factory ReviewDetail({
    required int id,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_dt') required String updatedDt,
    required int score,
    required String contents,
    required String date,
    @JsonKey(name: 'user') required int userId,
    @JsonKey(name: 'shop') required int shopId,
  }) = _ReviewDetail;

  factory ReviewDetail.fromJson(Map<String, dynamic> json) =>
      _$ReviewDetailFromJson(json);
}

@freezed
class ReviewContent with _$ReviewContent {
  factory ReviewContent({
    required String contents,
  }) = _ReviewContent;

  factory ReviewContent.fromJson(Map<String, dynamic> json) =>
      _$ReviewContentFromJson(json);
}
