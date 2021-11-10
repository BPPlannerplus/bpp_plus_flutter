import 'package:bpp_riverpod/app/model/shop/shop_data.dart';
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

  void setLike(int id) {
    state = state.copyWith(
      shopDatas: state.shopDatas.map<ShopData>((e) {
        return e.id == id ? e.copyWith(like: !e.like) : e;
      }).toList(),
    );
  }

  void reset() => state.shopDatas.clear();
}

class ShopDataState extends StateNotifier<ShopData> {
  ShopDataState(ShopData state) : super(state);

  setLike(int id) => state = state.copyWith(like: !state.like);
}
