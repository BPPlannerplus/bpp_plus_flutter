import 'package:bpp_riverpod/app/model/shop_data.dart';
import 'package:bpp_riverpod/app/model/shop_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShopListState extends StateNotifier<ShopList> {
  ShopListState()
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
        like: false,
        minPrice: 200000,
        profile:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSWX2EtpNdJxN2rTqCYLjdfjJA2TCZSem-jw&usqp=CAU',
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

final studioListProvider = StateNotifierProvider<ShopListState, ShopList>(
  (ref) => ShopListState(),
);
