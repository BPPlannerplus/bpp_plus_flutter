import 'package:bpp_riverpod/app/model/shop/shop_data.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_provider.dart';
import 'package:bpp_riverpod/app/repository/shop_wish_repository.dart';
import 'package:bpp_riverpod/app/ui/components/card/studio_card.dart';
import 'package:bpp_riverpod/app/ui/components/state/custom_load_indicator.dart';
import 'package:bpp_riverpod/app/ui/components/studio_grid/studio_paged_sliver_grid.dart';
import 'package:bpp_riverpod/app/ui/components/toast/toast.dart';
import 'package:bpp_riverpod/app/ui/wish/widget/no_item_card.dart';
import 'package:bpp_riverpod/app/util/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class TanningWishGrid extends ConsumerStatefulWidget {
  const TanningWishGrid({Key? key}) : super(key: key);

  @override
  ConsumerState<TanningWishGrid> createState() => _TanningWishGridState();
}

class _TanningWishGridState extends ConsumerState<TanningWishGrid> {
  final PagingController<int, ShopData> _pagingController =
      PagingController(firstPageKey: 1);
  final _fToast = FToast();
  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) => _fetchPage(pageKey));
    _fToast.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StudioPagedSliverGrid(
      pageController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<ShopData>(
        itemBuilder: (context, s, index) {
          final tanning = ref.watch(shopProvider(s));
          return StudioCard(
            shopData: tanning,
            setLike: () async {
              if (!tanning.like) {
                showToast(_fToast);
              }
              await ref
                  .read(shopWishListProvider)
                  .setLike(tanning.id, tanning.like);
              ref.read(shopProvider(s).notifier).setLike();
            },
            refresh: () {
              _pagingController.refresh();
            },
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
          await ref.read(shopWishRepositoryProvider).getTanningList(pageKey++);
      final isLastPage = newItems.shopDatas.length < pageSize;

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
