import 'package:bpp_riverpod/app/model/review.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reviews.freezed.dart';
part 'reviews.g.dart';

@freezed
class Reviews with _$Reviews {
  factory Reviews({
    required List<Review> reviews,
    required String next,
  }) = _Reviews;

  factory Reviews.fromJson(Map<String, dynamic> json) =>
      _$ReviewsFromJson(json);
}
