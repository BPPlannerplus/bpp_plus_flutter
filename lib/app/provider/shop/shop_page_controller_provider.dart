import 'package:bpp_riverpod/app/model/shop_concept.dart';
import 'package:bpp_riverpod/app/model/shop_data.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_detail_provider.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_provider.dart';
import 'package:bpp_riverpod/app/repository/shop_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

final studioPageControllerProvider =
    Provider<PagingController<int, ShopData>>((ref) {
  final _pagingController = PagingController<int, ShopData>(
    firstPageKey: 0,
  );

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await ref.read(studioListProvider.notifier).getData();
      final isLastPage = newItems.shopDatas.length < 20;

      if (isLastPage) {
        _pagingController.appendLastPage(newItems.shopDatas);
      } else {
        final nextPageKey = pageKey + newItems.shopDatas.length;
        _pagingController.appendPage(newItems.shopDatas, nextPageKey);
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

final beautyPageControllerProvider =
    Provider<PagingController<int, ShopData>>((ref) {
  final _pagingController = PagingController<int, ShopData>(
    firstPageKey: 0,
  );

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await ref.read(studioListProvider.notifier).getData();
      final isLastPage = newItems.shopDatas.length < 20;

      if (isLastPage) {
        _pagingController.appendLastPage(newItems.shopDatas);
      } else {
        final nextPageKey = pageKey + newItems.shopDatas.length;
        _pagingController.appendPage(newItems.shopDatas, nextPageKey);
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

final waxingPageControllerProvider =
    Provider<PagingController<int, ShopData>>((ref) {
  final _pagingController = PagingController<int, ShopData>(
    firstPageKey: 0,
  );

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await ref.read(studioListProvider.notifier).getData();
      final isLastPage = newItems.shopDatas.length < 20;

      if (isLastPage) {
        _pagingController.appendLastPage(newItems.shopDatas);
      } else {
        final nextPageKey = pageKey + newItems.shopDatas.length;
        _pagingController.appendPage(newItems.shopDatas, nextPageKey);
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

final tanningPageControllerProvider =
    Provider<PagingController<int, ShopData>>((ref) {
  final _pagingController = PagingController<int, ShopData>(
    firstPageKey: 0,
  );

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await ref.read(studioListProvider.notifier).getData();
      final isLastPage = newItems.shopDatas.length < 20;

      if (isLastPage) {
        _pagingController.appendLastPage(newItems.shopDatas);
      } else {
        final nextPageKey = pageKey + newItems.shopDatas.length;
        _pagingController.appendPage(newItems.shopDatas, nextPageKey);
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

final shopDetailConceptPageControllerProvider = Provider.family
    .autoDispose<PagingController<int, ShopConcept>, int>((ref, id) {
  final _pagingController = PagingController<int, ShopConcept>(
    firstPageKey: 0,
  );

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await ref.read(shopRepositroyProvider).getShopConcepts();
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
