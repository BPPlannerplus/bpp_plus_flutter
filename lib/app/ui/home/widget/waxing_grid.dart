import 'package:bpp_riverpod/app/model/shop/shop_data.dart';
import 'package:bpp_riverpod/app/model/shop/shop_list_dto.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_paging_state_provider.dart';
import 'package:bpp_riverpod/app/ui/components/card/studio_card.dart';
import 'package:bpp_riverpod/app/ui/components/state/custom_load_indicator.dart';
import 'package:bpp_riverpod/app/ui/components/state/empty_item_text.dart';
import 'package:bpp_riverpod/app/ui/components/studio_grid/studio_paged_sliver_grid.dart';
import 'package:bpp_riverpod/app/ui/components/toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class WaxingGrid extends ConsumerWidget {
  const WaxingGrid({
    Key? key,
    required this.fToast,
    required this.pagingController,
  }) : super(key: key);

  final FToast fToast;
  final PagingController<int, ShopData> pagingController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<ShopListDto>(waxingPagingStateProvider, (prev, next) {
      pagingController.value = PagingState(
        itemList: next.shopData,
        nextPageKey: next.hasNext ? next.nextPage : null,
        error: null,
      );
    });
    return StudioPagedSliverGrid(
      pageController: pagingController,
      builderDelegate: PagedChildBuilderDelegate<ShopData>(
        itemBuilder: (context, shop, index) {
          return StudioCard(
            shopData: shop,
            setLike: () async {
              if (!shop.like) {
                showToast(fToast);
              }
              ref
                  .read(waxingPagingStateProvider.notifier)
                  .setLike(index: index);
            },
            index: index,
            detailPageCallback: ref
                .read(waxingPagingStateProvider.notifier)
                .setLikeDetailCallback,
          );
        },
        firstPageProgressIndicatorBuilder: (context) =>
            customLoadingIndicator(),
        newPageProgressIndicatorBuilder: (context) => customLoadingIndicator(),
        noItemsFoundIndicatorBuilder: (context) =>
            emptyItemText('해당 스튜디오가 존재하지 않습니다!'),
      ),
    );
  }
}
