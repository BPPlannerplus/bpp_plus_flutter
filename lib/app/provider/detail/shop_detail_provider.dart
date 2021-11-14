import 'package:bpp_riverpod/app/model/review/complain.dart';
import 'package:bpp_riverpod/app/model/shop/shop_detail_data.dart';
import 'package:bpp_riverpod/app/repository/shop_detail_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shopDetailProvider =
    FutureProvider.family.autoDispose<ShopDetailData, int>((ref, shopId) async {
  final repository = ref.watch(shopDetailRepository);
  return await repository.getShopDetail(shopId);
});

final shopDetailStateProvider = StateNotifierProvider.family
    .autoDispose<ShopDetailState, ShopDetailData, ShopDetailData>((ref, data) {
  final repository = ref.watch(shopDetailRepository);
  return ShopDetailState(data, repository: repository);
});

class ShopDetailState extends StateNotifier<ShopDetailData> {
  ShopDetailState(ShopDetailData state, {required this.repository})
      : super(state);

  final ShopDetailRepository repository;

  setLike() {
    state = state.copyWith(like: !state.like);
  }

  Future<dynamic> createReservation(int id) async {
    final response = await repository.shopReservation(id);
    return response;
  }

  Future<dynamic> reportReview(int id, Complain complain) async {
    final response = await repository.reportReview(id, complain);
    return response;
  }
}
