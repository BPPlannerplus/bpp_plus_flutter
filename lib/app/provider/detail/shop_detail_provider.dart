import 'package:bpp_riverpod/app/model/shop/shop_detail_data.dart';
import 'package:bpp_riverpod/app/repository/shop_detail_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shopDetailProvider =
    FutureProvider.family.autoDispose<ShopDetailData, int>((ref, shopId) async {
  final repository = ref.watch(shopDetailRepository);
  return await repository.getShopDetail();
});

final shopDetailStateProvider = StateNotifierProvider.family
    .autoDispose<ShopDetailState, ShopDetailData, ShopDetailData>((ref, data) {
  final repository = ref.watch(shopDetailRepository);
  return ShopDetailState(data, repository: repository);
});

class ShopDetailState extends StateNotifier<ShopDetailData> {
  ShopDetailState(ShopDetailData state, {required this.repository})
      : super(state);

  final ShopDetailReposiroty repository;

  setLike() {
    state = state.copyWith(like: !state.like);
  }

  createReservation() {}

  reportReview() {}
}
