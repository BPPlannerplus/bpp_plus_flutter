import 'package:bpp_riverpod/app/model/concept/concept_list.dart';
import 'package:bpp_riverpod/app/model/shop/shop_list.dart';

abstract class ShopWishRepository {
  // 샵 목록 조회
  Future<ShopList> getShopList();

  // 샵 좋아요
  Future<void> setShopLike();

  // 컨셉 목록 조회
  Future<ConceptList> getConceptList();

  // 컨셉 좋아요
  Future<void> setConceptLike();
}
