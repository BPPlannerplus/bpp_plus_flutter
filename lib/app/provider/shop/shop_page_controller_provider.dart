import 'dart:developer' as dp;

import 'package:bpp_riverpod/app/model/enum/shop_type.dart';
import 'package:bpp_riverpod/app/model/shop/shop_data.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_filter_provider.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_provider.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_type_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

final shopPageControllerProvider =
    Provider<PagingController<int, ShopData>>((ref) {
  final shopType = ref.watch(shopTypeProvider);
  switch (shopType) {
    case ShopType.stduio:
      return ref.watch(studioPageControllerProvider);
    case ShopType.beauty:
      return ref.watch(beautyPageControllerProvider);
    case ShopType.waxing:
      return ref.watch(waxingPageControllerProvider);
    case ShopType.tanning:
      return ref.watch(tanningPageControllerProvider);
  }
});

final studioPageControllerProvider =
    Provider<PagingController<int, ShopData>>((ref) {
  final _pagingController = PagingController<int, ShopData>(firstPageKey: 0);

  Future<void> _fetchPage(int pageKey) async {
    final address = ref.watch(studioFilterProvider.notifier).makeFilter();
    try {
      final newItems = await ref
          .read(studioListProvider.notifier)
          .getData(ShopType.stduio, address);
      final isLastPage = newItems.next ?? 'no Data';

      if (isLastPage == 'no Data') {
        _pagingController.appendLastPage(newItems.shopDatas);
      } else {
        final nextPageKey = pageKey + newItems.shopDatas.length;
        _pagingController.appendPage(newItems.shopDatas, nextPageKey);
      }
    } catch (error) {
      dp.log(error.toString());
      _pagingController.error = error;
    }
  }

  _pagingController.addPageRequestListener((pageKey) => _fetchPage(pageKey));
  return _pagingController;
});

final beautyPageControllerProvider =
    Provider<PagingController<int, ShopData>>((ref) {
  final _pagingController = PagingController<int, ShopData>(firstPageKey: 0);

  Future<void> _fetchPage(int pageKey) async {
    final adress = ref.watch(beautyFilterProvider.notifier).makeFilter();
    try {
      final newItems = await ref
          .read(beautyListProvider.notifier)
          .getData(ShopType.beauty, adress);
      final isLastPage = newItems.next ?? 'no Data';

      if (isLastPage == 'no Data') {
        _pagingController.appendLastPage(newItems.shopDatas);
      } else {
        final nextPageKey = pageKey + newItems.shopDatas.length;
        _pagingController.appendPage(newItems.shopDatas, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  _pagingController.addPageRequestListener((pageKey) => _fetchPage(pageKey));
  return _pagingController;
});

final waxingPageControllerProvider =
    Provider<PagingController<int, ShopData>>((ref) {
  final _pagingController = PagingController<int, ShopData>(firstPageKey: 0);

  Future<void> _fetchPage(int pageKey) async {
    final adress = ref.watch(waxingFilterProvider.notifier).makeFilter();
    try {
      final newItems = await ref
          .read(waxingListProvider.notifier)
          .getData(ShopType.waxing, adress);
      final isLastPage = newItems.next ?? 'no Data';

      if (isLastPage == 'no Data') {
        _pagingController.appendLastPage(newItems.shopDatas);
      } else {
        final nextPageKey = pageKey + newItems.shopDatas.length;
        _pagingController.appendPage(newItems.shopDatas, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  _pagingController.addPageRequestListener((pageKey) => _fetchPage(pageKey));
  return _pagingController;
});

final tanningPageControllerProvider =
    Provider<PagingController<int, ShopData>>((ref) {
  final _pagingController = PagingController<int, ShopData>(firstPageKey: 0);

  Future<void> _fetchPage(int pageKey) async {
    final adress = ref.watch(tanningFilterProvider.notifier).makeFilter();
    try {
      final newItems = await ref
          .read(tanningListProvider.notifier)
          .getData(ShopType.tanning, adress);
      final isLastPage = newItems.next ?? 'no Data';

      if (isLastPage == 'no Data') {
        _pagingController.appendLastPage(newItems.shopDatas);
      } else {
        final nextPageKey = pageKey + newItems.shopDatas.length;
        _pagingController.appendPage(newItems.shopDatas, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  _pagingController.addPageRequestListener((pageKey) => _fetchPage(pageKey));
  return _pagingController;
});
