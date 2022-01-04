import 'package:bpp_riverpod/app/model/review/review_detail.dart';
import 'package:bpp_riverpod/app/repository/mypage_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final reviewDetailProvider =
    FutureProvider.family.autoDispose<ReviewDetail, int>((ref, id) {
  return ref.watch(mypageRepsitory).getReview(id);
});

final reviewDetailReadProvider = Provider.family
    .autoDispose<ReviewDetail, ReviewDetail>((ref, reviewDetail) {
  return ref.watch(reviewDetailStateProvider(reviewDetail));
});

final reviewDetailStateProvider = StateNotifierProvider.family
    .autoDispose<ReviewDetailState, ReviewDetail, ReviewDetail>(
        (ref, reveiwDetail) => ReviewDetailState(reveiwDetail));

class ReviewDetailState extends StateNotifier<ReviewDetail> {
  ReviewDetailState(ReviewDetail state) : super(state);

  void updateReview(String contents) {
    state = state.copyWith(contents: contents);
  }
}
