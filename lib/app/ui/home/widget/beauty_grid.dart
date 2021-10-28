import 'package:bpp_riverpod/app/model/shop_data.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_page_controller_provider.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_provider.dart';
import 'package:bpp_riverpod/app/ui/home/widget/home_grid_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class BeautyGrid extends ConsumerStatefulWidget {
  const BeautyGrid({Key? key}) : super(key: key);

  @override
  ConsumerState<BeautyGrid> createState() => _BeautyGridState();
}

class _BeautyGridState extends ConsumerState<BeautyGrid> {
  @override
  Widget build(BuildContext context) {
    return PagedSliverGrid(
      pagingController: ref.watch(beautyPageControllerProvider),
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
          final beauty = ref.watch(beautyProvider(shop));
          final beautyState = ref.read(beautyProvider(shop).notifier);

          return homeGridCard(
            shop: beauty,
            shopState: beautyState,
          );
        },
      ),
    );
  }
}
