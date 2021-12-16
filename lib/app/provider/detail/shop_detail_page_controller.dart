import 'package:bpp_riverpod/app/model/shop/shop_concept.dart';
import 'package:bpp_riverpod/app/repository/shop_detail_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

final shopDetailConceptPageControllerProvider = Provider.family
    .autoDispose<PagingController<int, ShopConcept>, int>((ref, id) {
  int _page = 1;

  final _pagingController = PagingController<int, ShopConcept>(
    firstPageKey: 0,
  );

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems =
          await ref.read(shopDetailRepository).getShopConcepts(id, _page++);
      final isLastPage = newItems.next ?? 'no Data';

      if (isLastPage == 'no Data') {
        _pagingController.appendLastPage(newItems.shopConcepts);
      } else {
        final nextPageKey = pageKey + newItems.shopConcepts.length;
        _pagingController.appendPage(newItems.shopConcepts, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  _pagingController.addPageRequestListener((pageKey) {
    _fetchPage(pageKey);
  });
  return _pagingController;
});
