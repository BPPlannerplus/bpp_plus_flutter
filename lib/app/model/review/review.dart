import 'package:bpp_riverpod/app/model/auth/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'review.g.dart';
part 'review.freezed.dart';

@freezed
class Review with _$Review {
  factory Review({
    required int id,
    required User user,
    required int score,
    String? contents,
    required String date,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}

@freezed
class ReviewRequest with _$ReviewRequest {
  factory ReviewRequest({
    int? score,
    String? contents,
  }) = _ReviewRequest;

  factory ReviewRequest.fromJson(Map<String, dynamic> json) =>
      _$ReviewRequestFromJson(json);
}
