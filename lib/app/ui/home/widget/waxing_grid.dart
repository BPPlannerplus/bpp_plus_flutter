import 'package:bpp_riverpod/app/model/shop/shop_data.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_page_controller_provider.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_provider.dart';
import 'package:bpp_riverpod/app/ui/home/widget/home_grid_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class WaxingGrid extends ConsumerStatefulWidget {
  const WaxingGrid({Key? key}) : super(key: key);

  @override
  ConsumerState<WaxingGrid> createState() => _WaxingGridState();
}

class _WaxingGridState extends ConsumerState<WaxingGrid> {
  @override
  Widget build(BuildContext context) {
    return PagedSliverGrid(
      pagingController: ref.watch(waxingPageControllerProvider),
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
          final waxing = ref.watch(waxingProvider(shop));
          final waxingState = ref.read(waxingProvider(shop).notifier);

          return homeGridCard(
            shop: waxing,
            shopState: waxingState,
          );
        },
      ),
    );
  }
}
