import 'package:bpp_riverpod/app/model/shop/shop_data.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_page_controller_provider.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_provider.dart';
import 'package:bpp_riverpod/app/ui/components/state/custom_load_indicator.dart';
import 'package:bpp_riverpod/app/ui/components/state/empty_item_text.dart';
import 'package:bpp_riverpod/app/ui/components/studio_grid/studio_paged_sliver_grid.dart';
import 'package:bpp_riverpod/app/ui/components/toast/toast.dart';
import 'package:bpp_riverpod/app/ui/home/widget/home_grid_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class WaxingGrid extends ConsumerWidget {
  const WaxingGrid({
    Key? key,
    required this.fToast,
  }) : super(key: key);

  final FToast fToast;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StudioPagedSliverGrid(
      pageController: ref.watch(waxingPageControllerProvider),
      builderDelegate: PagedChildBuilderDelegate<ShopData>(
        itemBuilder: (context, shop, index) {
          final waxing = ref.watch(waxingListProvider);

          return HomeGridCard(
            shop: waxing.shopDatas[index],
            setLike: () async {
              if (!waxing.shopDatas[index].like) {
                showToast(fToast);
              }
              await ref.read(waxingListProvider.notifier).setLike(
                    waxing.shopDatas[index].id,
                    waxing.shopDatas[index].like,
                  );
            },
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
