import 'package:bpp_riverpod/app/model/shop/shop_data.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_provider.dart';
import 'package:bpp_riverpod/app/repository/shop_wish_repository.dart';
import 'package:bpp_riverpod/app/ui/components/card/studio_card.dart';
import 'package:bpp_riverpod/app/ui/components/state/custom_load_indicator.dart';
import 'package:bpp_riverpod/app/ui/components/studio_grid/studio_paged_sliver_grid.dart';
import 'package:bpp_riverpod/app/ui/components/toast/toast.dart';
import 'package:bpp_riverpod/app/ui/wish/widget/no_item_card.dart';
import 'package:bpp_riverpod/app/util/values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class StudioWishGrid extends ConsumerStatefulWidget {
  const StudioWishGrid({Key? key}) : super(key: key);

  @override
  ConsumerState<StudioWishGrid> createState() => _StudioWishGridState();
}

class _StudioWishGridState extends ConsumerState<StudioWishGrid> {
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
        itemBuilder: (context, shop, index) {
          final studio = ref.watch(shopProvider(shop));
          return StudioCard(
            shopData: studio,
            setLike: () async {
              if (!studio.like) {
                showToast(_fToast);
              }
              ref.read(shopProvider(shop).notifier).setLike();
              await ref
                  .read(shopWishRepositoryProvider)
                  .setShopLike(studio.id, !studio.like);
            },
            index: index,
            detailPageCallback:
                ref.read(shopProvider(shop).notifier).setLikeCallback,
          );
        },
        firstPageProgressIndicatorBuilder: (context) =>
            customLoadingIndicator(),
        newPageProgressIndicatorBuilder: (context) => customLoadingIndicator(),
        noItemsFoundIndicatorBuilder: (context) => const NoItemCard(),
      ),
    );
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems =
          await ref.read(shopWishRepositoryProvider).getStudioList(pageKey++);
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
