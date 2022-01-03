// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_detail.freezed.dart';
part 'review_detail.g.dart';

@freezed
class ReviewDetail with _$ReviewDetail {
  factory ReviewDetail({
    required int id,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedDt,
    required int score,
    String? contents,
    required String date,
    required bool editable,
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
