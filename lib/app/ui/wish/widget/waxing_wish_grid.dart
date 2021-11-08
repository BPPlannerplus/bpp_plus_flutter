import 'package:bpp_riverpod/app/model/shop/shop_data.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_provider.dart';
import 'package:bpp_riverpod/app/ui/wish/widget/wish_grid_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class WaxingWishGrid extends ConsumerStatefulWidget {
  const WaxingWishGrid({Key? key}) : super(key: key);

  @override
  ConsumerState<WaxingWishGrid> createState() => _WaxingWishGridState();
}

class _WaxingWishGridState extends ConsumerState<WaxingWishGrid> {
  final int _pageSize = 30;

  final PagingController<int, ShopData> _pagingController =
      PagingController(firstPageKey: 0);
  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final newItems = List.generate(
        30,
        (index) => ShopData(
          id: index,
          name: 'Shop $index',
          address: '서울시 마포구',
          like: true,
          minPrice: 300000,
          profile:
              'https://www.gvalley.co.kr/news/photo/202003/569892_48782_812.png',
        ),
      ).toList();
      final isLastPage = newItems.length < _pageSize;

      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PagedSliverGrid(
      pagingController: _pagingController,
      showNewPageProgressIndicatorAsGridChild: false,
      showNewPageErrorIndicatorAsGridChild: false,
      showNoMoreItemsIndicatorAsGridChild: false,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 188,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 100 / 150,
      ),
      builderDelegate: PagedChildBuilderDelegate<ShopData>(
        itemBuilder: (context, s, index) {
          final waxing = ref.watch(shopProvider(s));
          final waxingState = ref.read(shopProvider(s).notifier);
          return wishGridCard(
            shop: waxing,
            stateRead: waxingState,
          );
        },
      ),
    );
  }
}
