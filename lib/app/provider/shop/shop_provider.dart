import 'package:bpp_riverpod/app/model/shop/shop_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shopProvider = StateNotifierProvider.family
    .autoDispose<ShopDataState, ShopData, ShopData>(
        (ref, shop) => ShopDataState(shop));

class ShopDataState extends StateNotifier<ShopData> {
  ShopDataState(ShopData state) : super(state);

  void setLike() => state = state.copyWith(like: !state.like);

  void setLikeCallback(bool like) => state = state.copyWith(like: like);
}
