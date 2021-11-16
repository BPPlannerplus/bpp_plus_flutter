import 'package:bpp_riverpod/app/model/shop/shop_data.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_provider.dart';
import 'package:bpp_riverpod/app/repository/shop_wish_repository.dart';
import 'package:bpp_riverpod/app/ui/wish/widget/wish_grid_card.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class BeautyWishGrid extends ConsumerStatefulWidget {
  const BeautyWishGrid({Key? key}) : super(key: key);

  @override
  ConsumerState<BeautyWishGrid> createState() => _BeautyWishGridState();
}

class _BeautyWishGridState extends ConsumerState<BeautyWishGrid> {
  final int _pageSize = 20;
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
          await ref.read(shopWishRepositoryProvider).getBeautyList(_page);
      _page++;
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
          final beauty = ref.watch(shopProvider(s));
          final beautyState = ref.read(shopProvider(s).notifier);
          return wishGridCard(
            shop: beauty,
            stateRead: beautyState,
          );
        },
        noItemsFoundIndicatorBuilder: (context) {
          return SizedBox(
            height: 100,
            child: Center(
              child: Text(
                '아이템이 없습니다!',
                style: BppTextStyle.defaultText,
              ),
            ),
          );
        },
      ),
    );
  }
}
