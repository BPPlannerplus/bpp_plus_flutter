import 'package:bpp_riverpod/app/model/enum/shop_type.dart';
import 'package:bpp_riverpod/app/model/shop/shop_list.dart';
import 'package:bpp_riverpod/app/model/shop/shop_list_dto.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_type_provider.dart';
import 'package:bpp_riverpod/app/repository/shop_repository.dart';
import 'package:bpp_riverpod/app/util/values.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shopPagingStateProvider = Provider.autoDispose<ShopPaigingState>((ref) {
  final shopType = ref.watch(shopTypeProvider);
  switch (shopType) {
    case ShopType.stduio:
      return ref.watch(studioPagingStateProvider.notifier);
    case ShopType.beauty:
      return ref.watch(beautyPagingStateProvider.notifier);
    case ShopType.waxing:
      return ref.watch(waxingPagingStateProvider.notifier);
    case ShopType.tanning:
      return ref.watch(tanningPagingStateProvider.notifier);
  }
});

final studioPagingStateProvider =
    StateNotifierProvider.autoDispose<ShopPaigingState, ShopListDto>((ref) {
  final shopRepository = ref.watch(shopRepositroyProvider);
  return ShopPaigingState(shopRepository: shopRepository);
});

final beautyPagingStateProvider =
    StateNotifierProvider.autoDispose<ShopPaigingState, ShopListDto>((ref) {
  final shopRepository = ref.watch(shopRepositroyProvider);
  return ShopPaigingState(shopRepository: shopRepository);
});

final waxingPagingStateProvider =
    StateNotifierProvider.autoDispose<ShopPaigingState, ShopListDto>((ref) {
  final shopRepository = ref.watch(shopRepositroyProvider);
  return ShopPaigingState(shopRepository: shopRepository);
});

final tanningPagingStateProvider =
    StateNotifierProvider.autoDispose<ShopPaigingState, ShopListDto>((ref) {
  final shopRepository = ref.watch(shopRepositroyProvider);
  return ShopPaigingState(shopRepository: shopRepository);
});

class ShopPaigingState extends StateNotifier<ShopListDto> {
  ShopPaigingState({required this.shopRepository})
      : super(
          ShopListDto(
            shopData: [],
            nextPage: 1,
            hasNext: true,
          ),
        );

  final ShopRepository shopRepository;

  Future<void> getShopList({
    required int page,
    required List<String> address,
    required ShopType shopType,
  }) async {
    late ShopList response;

    switch (shopType) {
      case ShopType.stduio:
        response = await shopRepository.getStudioList(address, page++);
        break;
      case ShopType.beauty:
        response = await shopRepository.getBeautyList(address, page++);
        break;
      case ShopType.waxing:
        response = await shopRepository.getWaxingList(address, page++);
        break;
      case ShopType.tanning:
        response = await shopRepository.getTanningList(address, page++);
        break;
    }

    state = state.copyWith(
      shopData: [...state.shopData, ...response.shopDatas],
      hasNext: response.shopDatas.length == pageSize,
      nextPage: page,
    );
  }

  Future<dynamic> setLike({required int index}) async {
    var curShopData = state.shopData;
    curShopData[index] = curShopData[index].copyWith(
      like: !curShopData[index].like,
    );
    state = state.copyWith(shopData: [...curShopData]);
    await shopRepository.setLike(
        state.shopData[index].id, state.shopData[index].like);
  }

  void setLikeDetailCallback(int index, bool like) {
    var curShopData = state.shopData;
    curShopData[index] = curShopData[index].copyWith(like: like);
    state = state.copyWith(shopData: [...curShopData]);
  }

  void reset() => state = state = ShopListDto(
        shopData: [],
        nextPage: 1,
        hasNext: true,
      );
}
