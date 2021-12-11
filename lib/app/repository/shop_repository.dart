import 'package:bpp_riverpod/app/api/api_provider.dart';
import 'package:bpp_riverpod/app/api/shop_client.dart';
import 'package:bpp_riverpod/app/model/like.dart';
import 'package:bpp_riverpod/app/model/shop/shop_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shopRepositroyProvider = Provider<ShopRepository>((ref) {
  final shopClient = ref.watch(shopClientProvider);
  return ShopRepository(shopClient: shopClient);
});

class ShopRepository {
  ShopRepository({
    required this.shopClient,
  });
  final ShopClient shopClient;

  Future<ShopList> getStudioList(List<String> address, int page) async {
    final shopList = await shopClient.getStudioList(page, false, address);
    return shopList;
  }

  Future<ShopList> getBeautyList(List<String> address, int page) async {
    final shopList = await shopClient.getBeautyList(page, false, address);
    return shopList;
  }

  Future<ShopList> getWaxingList(List<String> address, int page) async {
    final shopList = await shopClient.getWaxingList(page, false, address);
    return shopList;
  }

  Future<ShopList> getTanningList(List<String> address, int page) async {
    final shopList = await shopClient.getTanningList(page, false, address);
    return shopList;
  }

  Future<dynamic> setLike(int id, bool like) async {
    final response = await shopClient.setLike(id, LikeRequest(like: like));
    return response;
  }
}
