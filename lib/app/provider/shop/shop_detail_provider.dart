import 'package:bpp_riverpod/app/model/shop_detail_data.dart';
import 'package:bpp_riverpod/app/provider/shop_state.dart';
import 'package:bpp_riverpod/app/repository/shop_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shopDetailProvider =
    FutureProvider.family.autoDispose<ShopDetailData, int>(
  (ref, shopId) {
    return ref.watch(shopRepositroyProvider).getShopDetailData(shopId);
  },
);

final shopDetailStateProvider = StateNotifierProvider.family
    .autoDispose<ShopDetailState, ShopDetailData, ShopDetailData>(
  (ref, shopData) {
    return ShopDetailState(shopData);
  },
);
