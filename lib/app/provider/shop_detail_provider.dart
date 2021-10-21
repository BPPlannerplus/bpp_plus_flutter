import 'package:bpp_riverpod/app/model/shop_concept.dart';
import 'package:bpp_riverpod/app/model/shop_detail_data.dart';
import 'package:bpp_riverpod/app/repository/shop_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shopDetailProvider = FutureProvider.family
    .autoDispose<ShopDetailData, DetailIndex>((ref, detailIndex) {
  return ref
      .watch(shopRepositroyProvider)
      .getShopDetailData(detailIndex.shopId);
});

final shopRepositroyProvider =
    Provider<ShopRepositroy>((ref) => ShopRepositroy());

class ShopDetailState extends StateNotifier<ShopDetailData> {
  ShopDetailState(ShopDetailData state) : super(state);

  setLike() {
    state = state.copyWith(
      like: !state.like,
    );
  }
}

final shopDetailStateProvider = StateNotifierProvider.family
    .autoDispose<ShopDetailState, ShopDetailData, ShopDetailData>(
        (ref, shopData) {
  return ShopDetailState(shopData);
});

class ShopConceptsState extends StateNotifier<ShopConcepts> {
  ShopConceptsState()
      : super(
          ShopConcepts(
            shopConcepts: [],
            next: 'true',
          ),
        );

  Future<void> getData() async {
    await Future.delayed(const Duration(seconds: 1));

    if (state.shopConcepts.length > 50) {
      state = state.copyWith(
        next: '',
      );
      return;
    }

    var newData = List.generate(
      30,
      (index) => ShopConcept(
        id: index,
        profile:
            'http://file.mk.co.kr/meet/neds/2021/05/image_readtop_2021_441365_16203623974637324.jpg',
      ),
    );

    state = state.copyWith(
      shopConcepts: [
        ...state.shopConcepts,
        ...newData,
      ],
    );
  }

  void reset() {
    state = state.copyWith(shopConcepts: []);
  }
}

final shopConceptsProvider = StateNotifierProvider.family
    .autoDispose<ShopConceptsState, ShopConcepts, int>(
        (ref, id) => ShopConceptsState());
