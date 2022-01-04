import 'package:bpp_riverpod/app/model/shop/shop_data.dart';
import 'package:bpp_riverpod/app/model/shop/shop_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShopWishListState extends StateNotifier<ShopList> {
  ShopWishListState()
      : super(
          ShopList(
            shopDatas: [],
            next: 'true',
          ),
        );
  getData() async {
    await Future.delayed(const Duration(seconds: 1));

    if (state.shopDatas.length > 100) {
      state = state.copyWith(
        next: '',
      );
      return;
    }

    var newData = List.generate(
      40,
      (index) => ShopData(
        id: index,
        name: 'Shop $index',
        address: '서울시 관악구',
        like: true,
        minPrice: 200000,
        profile:
            'https://thumbnews.nateimg.co.kr/view610///news.nateimg.co.kr/orgImg/mw/2021/05/07/2021050713118010177_1.jpg',
      ),
    );

    state = state.copyWith(
      shopDatas: [
        ...state.shopDatas,
        ...newData,
      ],
    );
  }

  setShopLike(int index) {
    var newConcept = state.shopDatas[index].copyWith(
      like: !state.shopDatas[index].like,
    );

    var curConcpets = state.shopDatas;

    curConcpets[index] = newConcept;

    state = state.copyWith(shopDatas: curConcpets);
  }

  reset() {
    state = state.copyWith(
      shopDatas: [],
      next: 'true',
    );

    getData();
  }
}

final studioWishListProvider =
    StateNotifierProvider<ShopWishListState, ShopList>(
  (ref) => ShopWishListState(),
);
