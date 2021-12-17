import 'package:bpp_riverpod/app/model/shop/shop_data.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_page_controller_provider.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_provider.dart';
import 'package:bpp_riverpod/app/ui/components/card/studio_card.dart';
import 'package:bpp_riverpod/app/ui/components/state/custom_load_indicator.dart';
import 'package:bpp_riverpod/app/ui/components/state/empty_item_text.dart';
import 'package:bpp_riverpod/app/ui/components/studio_grid/studio_paged_sliver_grid.dart';
import 'package:bpp_riverpod/app/ui/components/toast/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class StudioGrid extends ConsumerWidget {
  const StudioGrid({Key? key, required this.fToast}) : super(key: key);

  final FToast fToast;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StudioPagedSliverGrid(
      pageController: ref.watch(studioPageControllerProvider),
      builderDelegate: PagedChildBuilderDelegate<ShopData>(
        itemBuilder: (context, shop, index) {
          final studios = ref.watch(studioListProvider);

          return StudioCard(
            shopData: studios.shopDatas[index],
            setLike: () async {
              if (!studios.shopDatas[index].like) {
                showToast(fToast);
              }
              await ref.read(studioListProvider.notifier).setLike(
                    studios.shopDatas[index].id,
                    studios.shopDatas[index].like,
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
