import 'package:bpp_riverpod/app/model/concept_list.dart';

abstract class WishRepository {
  Future<ConceptList> getWishList(int shopId);

  Future<void> setLike(int id);
}
