import 'package:freezed_annotation/freezed_annotation.dart';

part 'review.g.dart';
part 'review.freezed.dart';

@freezed
class Review with _$Review {
  factory Review({
    required int id,
    required String name,
    required String date,
    required int rate,
    required String text,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}
