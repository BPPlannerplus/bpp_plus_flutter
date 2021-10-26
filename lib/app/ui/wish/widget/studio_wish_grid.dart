import 'package:bpp_riverpod/app/provider/studio_wish_provider.dart';
import 'package:bpp_riverpod/app/ui/wish/widget/wish_grid_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StudioWishGrid extends ConsumerStatefulWidget {
  const StudioWishGrid({Key? key}) : super(key: key);

  @override
  ConsumerState<StudioWishGrid> createState() => _StudioWishGridState();
}

class _StudioWishGridState extends ConsumerState<StudioWishGrid> {
  @override
  void initState() {
    if (ref.read(studioWishListProvider).shopDatas.isEmpty) {
      ref.read(studioWishListProvider.notifier).getData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final studioList = ref.watch(studioWishListProvider);
    final studioListState = ref.read(studioWishListProvider.notifier);
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 188,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          if (studioList.next!.isNotEmpty &&
              index == studioList.shopDatas.length - 10) {
            ref.read(studioWishListProvider.notifier).getData();
          }
          if (index == studioList.shopDatas.length) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return wishGridCard(
            index: index,
            shopId: studioList.shopDatas[index].id,
            profile: studioList.shopDatas[index].profile,
            name: studioList.shopDatas[index].name,
            address: studioList.shopDatas[index].address,
            minPrice: studioList.shopDatas[index].minPrice,
            like: studioList.shopDatas[index].like,
            stateRead: studioListState,
          );
        },
        childCount:
            studioList.shopDatas.length + (studioList.next!.isNotEmpty ? 1 : 0),
      ),
    );
  }
}
