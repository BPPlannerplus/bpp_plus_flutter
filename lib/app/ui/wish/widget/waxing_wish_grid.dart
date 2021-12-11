import 'package:bpp_riverpod/app/model/shop/shop_data.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_provider.dart';
import 'package:bpp_riverpod/app/repository/shop_wish_repository.dart';
import 'package:bpp_riverpod/app/ui/components/state/custom_load_indicator.dart';
import 'package:bpp_riverpod/app/ui/wish/widget/no_item_card.dart';
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
  final int _pageSize = 20;

  final PagingController<int, ShopData> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) => _fetchPage(pageKey));
    super.initState();
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
        firstPageProgressIndicatorBuilder: (context) =>
            customLoadingIndicator(),
        newPageProgressIndicatorBuilder: (context) => customLoadingIndicator(),
        noItemsFoundIndicatorBuilder: (context) => noItemCard(),
      ),
    );
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems =
          await ref.read(shopWishRepositoryProvider).getWaxingList(pageKey++);
      final isLastPage = newItems.shopDatas.length < _pageSize;

      if (isLastPage) {
        _pagingController.appendLastPage(newItems.shopDatas);
      } else {
        _pagingController.appendPage(newItems.shopDatas, pageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }
}
