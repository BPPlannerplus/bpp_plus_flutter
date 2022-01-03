import 'package:bpp_riverpod/app/model/enum/shop_type.dart';
import 'package:bpp_riverpod/app/model/shop/shop_data.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_filter_provider.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_paging_state_provider.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_type_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

final shopPageControllerProvider =
    Provider.autoDispose<PagingController<int, ShopData>>((ref) {
  final shopType = ref.watch(shopTypeProvider);
  switch (shopType) {
    case ShopType.studio:
      return ref.watch(studioPageControllerProvider);
    case ShopType.beautyshop:
      return ref.watch(beautyPageControllerProvider);
    case ShopType.waxingshop:
      return ref.watch(waxingPageControllerProvider);
    case ShopType.tanningshop:
      return ref.watch(tanningPageControllerProvider);
  }
});

final studioPageControllerProvider =
    Provider.autoDispose<PagingController<int, ShopData>>((ref) {
  final _pagingController = PagingController<int, ShopData>(firstPageKey: 1);

  _pagingController.addPageRequestListener(
    (pageKey) => ref.watch(studioPagingStateProvider.notifier).getShopList(
          page: pageKey,
          address: ref.watch(studioFilterProvider.notifier).makeFilter(),
          shopType: ShopType.studio,
        ),
  );
  return _pagingController;
});

final beautyPageControllerProvider =
    Provider.autoDispose<PagingController<int, ShopData>>((ref) {
  final _pagingController = PagingController<int, ShopData>(firstPageKey: 1);

  _pagingController.addPageRequestListener(
    (pageKey) => ref.watch(beautyPagingStateProvider.notifier).getShopList(
          page: pageKey,
          address: ref.watch(beautyFilterProvider.notifier).makeFilter(),
          shopType: ShopType.beautyshop,
        ),
  );
  return _pagingController;
});

final waxingPageControllerProvider =
    Provider.autoDispose<PagingController<int, ShopData>>((ref) {
  final _pagingController = PagingController<int, ShopData>(firstPageKey: 1);

  _pagingController.addPageRequestListener(
    (pageKey) => ref.watch(waxingPagingStateProvider.notifier).getShopList(
          page: pageKey,
          address: ref.watch(waxingFilterProvider.notifier).makeFilter(),
          shopType: ShopType.waxingshop,
        ),
  );
  return _pagingController;
});

final tanningPageControllerProvider =
    Provider.autoDispose<PagingController<int, ShopData>>((ref) {
  final _pagingController = PagingController<int, ShopData>(firstPageKey: 1);

  _pagingController.addPageRequestListener(
    (pageKey) => ref.watch(tanningPagingStateProvider.notifier).getShopList(
          page: pageKey,
          address: ref.watch(tanningFilterProvider.notifier).makeFilter(),
          shopType: ShopType.tanningshop,
        ),
  );
  return _pagingController;
});
