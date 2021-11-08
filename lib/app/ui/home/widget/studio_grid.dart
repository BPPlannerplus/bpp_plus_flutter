import 'package:bpp_riverpod/app/model/shop/shop_data.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_page_controller_provider.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_provider.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_state.dart';
import 'package:bpp_riverpod/app/ui/home/widget/home_grid_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class StudioGrid extends ConsumerStatefulWidget {
  const StudioGrid({Key? key}) : super(key: key);

  @override
  ConsumerState<StudioGrid> createState() => _StudioGridState();
}

class _StudioGridState extends ConsumerState<StudioGrid> {
  @override
  Widget build(BuildContext context) {
    return PagedSliverGrid(
      pagingController: ref.watch(studioPageControllerProvider),
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
        itemBuilder: (context, shop, index) {
          final studio = ref.watch<ShopData>(
              studioListProvider.select((value) => value.shopDatas[index]));
          final studioState = ref.read(studioListProvider.notifier);

          return homeGridCard(
            shop: studio,
            shopState: studioState,
          );
        },
      ),
    );
  }
}
