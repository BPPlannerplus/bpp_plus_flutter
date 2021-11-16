import 'package:bpp_riverpod/app/model/shop/shop_data.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_page_controller_provider.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_provider.dart';
import 'package:bpp_riverpod/app/ui/home/widget/home_grid_card.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class BeautyGrid extends ConsumerWidget {
  const BeautyGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          final beauty = ref.watch<ShopData>(
              beautyListProvider.select((value) => value.shopDatas[index]));
          final beautyState = ref.read(beautyListProvider.notifier);

          return homeGridCard(
            shop: beauty,
            shopState: beautyState,
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
