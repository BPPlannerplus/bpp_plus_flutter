import 'package:bpp_riverpod/app/model/shop/shop_data.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_provider.dart';
import 'package:bpp_riverpod/app/repository/shop_wish_repository.dart';
import 'package:bpp_riverpod/app/ui/wish/widget/no_item_card.dart';
import 'package:bpp_riverpod/app/ui/wish/widget/wish_grid_card.dart';
import 'package:bpp_riverpod/app/util/widget/custom_load_indicator.dart';
import 'package:bpp_riverpod/app/util/widget/empty_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class TanningWishGrid extends ConsumerStatefulWidget {
  const TanningWishGrid({Key? key}) : super(key: key);

  @override
  ConsumerState<TanningWishGrid> createState() => _TanningWishGridState();
}

class _TanningWishGridState extends ConsumerState<TanningWishGrid> {
  final int _pageSize = 10;
  int _page = 1;

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
      final newItems =
          await ref.read(shopWishRepositoryProvider).getTanningList(_page++);
      final isLastPage = newItems.shopDatas.length < _pageSize;

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
          final tanning = ref.watch(shopProvider(s));
          final tanningState = ref.read(shopProvider(s).notifier);
          return wishGridCard(
            shop: tanning,
            stateRead: tanningState,
          );
        },
        firstPageProgressIndicatorBuilder: (context) =>
            customLoadingIndicator(),
        newPageProgressIndicatorBuilder: (context) => customLoadingIndicator(),
        noItemsFoundIndicatorBuilder: (context) => noItemCard(),
      ),
    );
  }
}
