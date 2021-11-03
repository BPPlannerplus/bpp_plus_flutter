import 'package:bpp_riverpod/app/model/shop/shop_data.dart';
import 'package:bpp_riverpod/app/model/shop/shop_detail_data.dart';
import 'package:bpp_riverpod/app/model/shop/shop_list.dart';
import 'package:bpp_riverpod/app/repository/shop_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShopListState extends StateNotifier<ShopList> {
  ShopListState({
    required this.repository,
  }) : super(ShopList(shopDatas: [], next: 'true'));

  final ShopRepository repository;

  Future<ShopList> getData() async {
    var newData = await repository.getShopList();
    state = state.copyWith(
      shopDatas: [
        ...state.shopDatas,
        ...newData.shopDatas,
      ],
      next: newData.next,
    );
    return newData;
  }

  reset() {
    state = state.copyWith(
      shopDatas: [],
      next: 'true',
    );

    getData();
  }
}

class ShopState extends StateNotifier<ShopData> {
  ShopState(ShopData state) : super(state);

  setLike(int id) {
    state = state.copyWith(like: !state.like);
  }
}

class ShopDetailState extends StateNotifier<ShopDetailData> {
  ShopDetailState(ShopDetailData state) : super(state);

  setLike() {
    state = state.copyWith(
      like: !state.like,
    );
  }
}
