// ignore_for_file: invalid_annotation_target

import 'package:bpp_riverpod/app/model/review/review.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_list.freezed.dart';
part 'review_list.g.dart';

@freezed
class ReviewList with _$ReviewList {
  factory ReviewList({
    @JsonKey(name: 'results') required List<Review> reviews,
    String? next,
  }) = _ReviewList;

  factory ReviewList.fromJson(Map<String, dynamic> json) =>
      _$ReviewListFromJson(json);
}
