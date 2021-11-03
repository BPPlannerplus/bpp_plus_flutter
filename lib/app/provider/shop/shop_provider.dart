import 'package:bpp_riverpod/app/model/shop/shop_data.dart';
import 'package:bpp_riverpod/app/model/shop/shop_list.dart';
import 'package:bpp_riverpod/app/provider/shop_state.dart';
import 'package:bpp_riverpod/app/repository/shop_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final studioListProvider = StateNotifierProvider<ShopListState, ShopList>(
  (ref) {
    final repository = ref.watch(shopRepositroyProvider);
    return ShopListState(
      repository: repository,
    );
  },
);
final studioProvider =
    StateNotifierProvider.family.autoDispose<ShopState, ShopData, ShopData>(
  (ref, shop) => ShopState(
    shop,
  ),
);

final beautyListProvider = StateNotifierProvider<ShopListState, ShopList>(
  (ref) {
    final repository = ref.watch(beautyRepositroyProvider);
    return ShopListState(
      repository: repository,
    );
  },
);
final beautyProvider =
    StateNotifierProvider.family.autoDispose<ShopState, ShopData, ShopData>(
  (ref, shop) => ShopState(
    shop,
  ),
);

final waxingListProvider = StateNotifierProvider<ShopListState, ShopList>(
  (ref) {
    final repository = ref.watch(waxingRepositroyProvider);
    return ShopListState(
      repository: repository,
    );
  },
);
final waxingProvider =
    StateNotifierProvider.family.autoDispose<ShopState, ShopData, ShopData>(
  (ref, shop) => ShopState(
    shop,
  ),
);

final tanningListProvider = StateNotifierProvider<ShopListState, ShopList>(
  (ref) {
    final repository = ref.watch(tanningRepositroyProvider);
    return ShopListState(
      repository: repository,
    );
  },
);
final tanningProvider =
    StateNotifierProvider.family.autoDispose<ShopState, ShopData, ShopData>(
  (ref, shop) => ShopState(
    shop,
  ),
);
