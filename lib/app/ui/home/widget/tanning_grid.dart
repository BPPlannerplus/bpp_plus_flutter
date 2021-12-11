import 'package:bpp_riverpod/app/model/shop/shop_data.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_page_controller_provider.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_provider.dart';
import 'package:bpp_riverpod/app/ui/components/state/custom_load_indicator.dart';
import 'package:bpp_riverpod/app/ui/components/state/empty_item_text.dart';
import 'package:bpp_riverpod/app/ui/home/widget/home_grid_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class TanningGrid extends ConsumerWidget {
  const TanningGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PagedSliverGrid(
      pagingController: ref.watch(tanningPageControllerProvider),
      showNewPageProgressIndicatorAsGridChild: false,
      showNewPageErrorIndicatorAsGridChild: false,
      showNoMoreItemsIndicatorAsGridChild: false,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 188.h,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 100 / 150,
      ),
      builderDelegate: PagedChildBuilderDelegate<ShopData>(
        itemBuilder: (context, shop, index) {
          final tannings = ref.watch(tanningListProvider);
          final tanningState = ref.read(tanningListProvider.notifier);

          return HomeGridCard(
            shop: tannings.shopDatas[index],
            shopState: tanningState,
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
