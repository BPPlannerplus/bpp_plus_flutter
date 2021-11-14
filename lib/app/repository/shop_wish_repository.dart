import 'package:bpp_riverpod/app/api/api_provider.dart';
import 'package:bpp_riverpod/app/api/concept_client.dart';
import 'package:bpp_riverpod/app/api/shop_client.dart';
import 'package:bpp_riverpod/app/model/concept/concept_list.dart';
import 'package:bpp_riverpod/app/model/like.dart';
import 'package:bpp_riverpod/app/model/shop/shop_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shopWishRepositoryProvider = Provider<ShopWishRepository>((ref) {
  final shopClient = ref.watch(shopClientProvider);
  final conceptClient = ref.watch(conceptClientProvider);
  return ShopWishRepository(
      shopClient: shopClient, conceptClient: conceptClient);
});

class ShopWishRepository {
  ShopWishRepository({
    required this.shopClient,
    required this.conceptClient,
  });

  final ShopClient shopClient;
  final ConceptClient conceptClient;

  Future<ShopList> getStudioList(int page) async {
    final shopList = await shopClient.getStudioList(page, true, null);
    return shopList;
  }

  Future<ShopList> getBeautyList(int page) async {
    final shopList = await shopClient.getBeautyList(page, true, null);
    return shopList;
  }

  Future<ShopList> getWaxingList(int page) async {
    final shopList = await shopClient.getTanningList(page, true, null);
    return shopList;
  }

  Future<ShopList> getTanningList(int page) async {
    final shopList = await shopClient.getBeautyList(page, true, null);
    return shopList;
  }

  Future<dynamic> setShopLike(int id, bool like) async {
    final response = await shopClient.setLike(id, LikeRequest(like: like));
    return response;
  }

  Future<ConceptList> getConceptList(int page) async {
    final conceptList = await conceptClient.getStudioList(
        page, true, null, null, null, null, null);
    return conceptList;
  }

  Future<dynamic> setConceptLike(int id, bool like) async {
    final response = await conceptClient.setLike(id, LikeRequest(like: like));
    return response;
  }
}
