import 'package:bpp_riverpod/app/model/review/review_list.dart';
import 'package:bpp_riverpod/app/repository/shop_detail_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shopReviewProvider =
    Provider.family.autoDispose<ReviewList, ReviewList>((ref, review) {
  final reviewState = ref.watch(shopReviewStateProvider(review));
  return reviewState;
});

final shopReviewStateProvider = StateNotifierProvider.family
    .autoDispose<ReivewListState, ReviewList, ReviewList>((ref, review) {
  final repository = ref.watch(shopDetailRepository);
  return ReivewListState(review, repository: repository);
});

final reviewResponseProvider =
    FutureProvider.family.autoDispose<ReviewList, int>((ref, shopId) async {
  final repository = ref.watch(shopDetailRepository);
  final response = await repository.getShopReviews(shopId);
  return response;
});

class ReivewListState extends StateNotifier<ReviewList> {
  ReivewListState(ReviewList state, {required this.repository}) : super(state);

  final ShopDetailRepository repository;

  // void reportReview(int reviewId) async {
  //   state = state.copyWith(
  //       reviews: state.reviews.where((e) => e.id != reviewId).toList());
  // }
}
