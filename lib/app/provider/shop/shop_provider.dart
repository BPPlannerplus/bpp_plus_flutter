import 'package:bpp_riverpod/app/model/shop/shop_data.dart';
import 'package:bpp_riverpod/app/model/shop/shop_list.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_state.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_type_provider.dart';
import 'package:bpp_riverpod/app/repository/shop_repository.dart';
import 'package:bpp_riverpod/app/util/enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shopListProvider = Provider<ShopListState>(
  (ref) {
    final shopType = ref.watch(shopTypeProvider);
    switch (shopType) {
      case ShopType.stduio:
        return ref.watch(studioListProvider.notifier);
      case ShopType.beauty:
        return ref.watch(beautyListProvider.notifier);
      case ShopType.waxing:
        return ref.watch(waxingListProvider.notifier);
      case ShopType.tanning:
        return ref.watch(tanningListProvider.notifier);
    }
  },
);

final shopWishListProvider = Provider<ShopListState>(
  (ref) {
    final shopType = ref.watch(shopWishTypeProvider);
    switch (shopType) {
      case ShopType.stduio:
        return ref.watch(studioListProvider.notifier);
      case ShopType.beauty:
        return ref.watch(beautyListProvider.notifier);
      case ShopType.waxing:
        return ref.watch(waxingListProvider.notifier);
      case ShopType.tanning:
        return ref.watch(tanningListProvider.notifier);
    }
  },
);

final studioListProvider =
    StateNotifierProvider<ShopListState, ShopList>((ref) {
  final repository = ref.watch(shopRepositroyProvider);
  return ShopListState(repository: repository);
});

final beautyListProvider =
    StateNotifierProvider<ShopListState, ShopList>((ref) {
  final repository = ref.watch(shopRepositroyProvider);
  return ShopListState(repository: repository);
});

final waxingListProvider =
    StateNotifierProvider<ShopListState, ShopList>((ref) {
  final repository = ref.watch(shopRepositroyProvider);
  return ShopListState(repository: repository);
});

final tanningListProvider =
    StateNotifierProvider<ShopListState, ShopList>((ref) {
  final repository = ref.watch(shopRepositroyProvider);
  return ShopListState(repository: repository);
});

final shopProvider = StateNotifierProvider.family
    .autoDispose<ShopDataState, ShopData, ShopData>(
        (ref, shop) => ShopDataState(shop));
