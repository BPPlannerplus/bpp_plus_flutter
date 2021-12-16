import 'package:bpp_riverpod/app/model/review/review_detail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myReviewStateProvider = StateNotifierProvider.family
    .autoDispose<MyReviewState, ReviewDetail, ReviewDetail>(
        (ref, reviewDetail) => MyReviewState(reviewDetail));

class MyReviewState extends StateNotifier<ReviewDetail> {
  MyReviewState(ReviewDetail state) : super(state);

  void updateReview(ReviewDetail reviewDetail) => state = reviewDetail;
}
