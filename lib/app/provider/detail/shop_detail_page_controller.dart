import 'package:bpp_riverpod/app/model/review/review.dart';
import 'package:bpp_riverpod/app/model/shop/shop_concept.dart';
import 'package:bpp_riverpod/app/repository/shop_detail_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

final shopDetailConceptPageControllerProvider = Provider.family
    .autoDispose<PagingController<int, ShopConcept>, int>((ref, id) {
  final _pagingController = PagingController<int, ShopConcept>(
    firstPageKey: 0,
  );

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems =
          await ref.read(shopDetailRepository).getShopConcepts(id, 1);
      final isLastPage = newItems.shopConcepts.length < 20;

      if (isLastPage) {
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

final shopDetailReviewPageControllerProvider =
    Provider.family.autoDispose<PagingController<int, Review>, int>((ref, id) {
  final _pagingController = PagingController<int, Review>(
    firstPageKey: 0,
  );

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await ref.read(shopDetailRepository).getShopReviews(id);
      print('newItems: ${newItems}');
      final isLastPage = newItems.reviews.length < 20;

      if (isLastPage) {
        _pagingController.appendLastPage(newItems.reviews);
      } else {
        final nextPageKey = pageKey + newItems.reviews.length;
        _pagingController.appendPage(newItems.reviews, nextPageKey);
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
