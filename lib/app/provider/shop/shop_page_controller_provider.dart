import 'dart:developer' as dev;

import 'package:bpp_riverpod/app/model/enum/shop_type.dart';
import 'package:bpp_riverpod/app/model/shop/shop_data.dart';
import 'package:bpp_riverpod/app/model/shop/shop_list.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_filter_provider.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_type_provider.dart';
import 'package:bpp_riverpod/app/repository/shop_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

final shopPageControllerProvider =
    Provider.autoDispose<PagingController<int, ShopData>>((ref) {
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
    Provider.autoDispose<PagingController<int, ShopData>>((ref) {
  final _pagingController = PagingController<int, ShopData>(firstPageKey: 1);

  _pagingController.addPageRequestListener(
    (pageKey) => _fetchPage(
      address: ref.watch(studioFilterProvider.notifier).makeFilter(),
      getList: ref.read(shopRepositroyProvider).getStudioList,
      pageKey: pageKey,
      pagingController: _pagingController,
    ),
  );
  return _pagingController;
});

final beautyPageControllerProvider =
    Provider.autoDispose<PagingController<int, ShopData>>((ref) {
  final _pagingController = PagingController<int, ShopData>(firstPageKey: 1);

  _pagingController.addPageRequestListener(
    (pageKey) => _fetchPage(
      address: ref.watch(beautyFilterProvider.notifier).makeFilter(),
      getList: ref.read(shopRepositroyProvider).getBeautyList,
      pageKey: pageKey,
      pagingController: _pagingController,
    ),
  );
  return _pagingController;
});

final waxingPageControllerProvider =
    Provider.autoDispose<PagingController<int, ShopData>>((ref) {
  final _pagingController = PagingController<int, ShopData>(firstPageKey: 1);

  _pagingController.addPageRequestListener(
    (pageKey) => _fetchPage(
      address: ref.watch(waxingFilterProvider.notifier).makeFilter(),
      getList: ref.read(shopRepositroyProvider).getWaxingList,
      pageKey: pageKey,
      pagingController: _pagingController,
    ),
  );
  return _pagingController;
});

final tanningPageControllerProvider =
    Provider.autoDispose<PagingController<int, ShopData>>((ref) {
  final _pagingController = PagingController<int, ShopData>(firstPageKey: 1);

  _pagingController.addPageRequestListener(
    (pageKey) => _fetchPage(
      address: ref.watch(tanningFilterProvider.notifier).makeFilter(),
      getList: ref.read(shopRepositroyProvider).getTanningList,
      pageKey: pageKey,
      pagingController: _pagingController,
    ),
  );
  return _pagingController;
});

Future<void> _fetchPage({
  required PagingController<int, ShopData> pagingController,
  required int pageKey,
  required List<String> address,
  required Future<ShopList> Function(List<String> address, int page) getList,
}) async {
  try {
    final newItems = await getList(address, pageKey++);
    final isLastPage = newItems.next ?? 'no Data';

    if (isLastPage == 'no Data') {
      pagingController.appendLastPage(newItems.shopDatas);
    } else {
      pagingController.appendPage(newItems.shopDatas, pageKey);
    }
  } catch (error) {
    dev.log(error.toString());
    pagingController.error = error;
  }
}
