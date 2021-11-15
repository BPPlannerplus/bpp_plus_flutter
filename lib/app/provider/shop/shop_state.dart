import 'package:bpp_riverpod/app/model/shop/shop_data.dart';
import 'package:bpp_riverpod/app/model/shop/shop_list.dart';
import 'package:bpp_riverpod/app/repository/shop_repository.dart';
import 'package:bpp_riverpod/app/util/enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShopListState extends StateNotifier<ShopList> {
  ShopListState({
    required this.repository,
  }) : super(ShopList(shopDatas: []));

  final ShopRepository repository;
  int _page = 1;

  Future<ShopList> getData(ShopType shopType, List<String> address) async {
    late ShopList newData;
    switch (shopType) {
      case ShopType.stduio:
        newData = await repository.getStudioList(address, _page);
        break;
      case ShopType.beauty:
        newData = await repository.getBeautyList(address, _page);
        break;
      case ShopType.waxing:
        newData = await repository.getWaxingList(address, _page);
        break;
      case ShopType.tanning:
        newData = await repository.getTanningList(address, _page);
        break;
    }
    _page++;

    state = state.copyWith(
      shopDatas: [
        ...state.shopDatas,
        ...newData.shopDatas,
      ],
      next: newData.next,
    );
    return newData;
  }

  Future<dynamic> setLike(int id, bool like) async {
    await repository.setLike(id, !like);
    state = state.copyWith(
      shopDatas: state.shopDatas.map<ShopData>((e) {
        return e.id == id ? e.copyWith(like: !like) : e;
      }).toList(),
    );
  }

  void reset() {
    _page = 1;
    state.shopDatas.clear();
  }
}

class ShopDataState extends StateNotifier<ShopData> {
  ShopDataState(ShopData state) : super(state);

  setLike(int id) => state = state.copyWith(like: !state.like);
}
