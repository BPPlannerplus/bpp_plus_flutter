import 'package:bpp_riverpod/app/provider/studio_provider.dart';
import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/ui/home/widget/home_grid_card.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:bpp_riverpod/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudioGrid extends ConsumerStatefulWidget {
  const StudioGrid({Key? key}) : super(key: key);

  @override
  ConsumerState<StudioGrid> createState() => _StudioGridState();
}

class _StudioGridState extends ConsumerState<StudioGrid> {
  @override
  void initState() {
    if (ref.read(studioListProvider).shopDatas.isEmpty) {
      ref.read(studioListProvider.notifier).getData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final studioList = ref.watch(studioListProvider);
    final studioListState = ref.read(studioListProvider.notifier);
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
            ref.read(studioListProvider.notifier).getData();
          }
          if (index == studioList.shopDatas.length) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return homeGridCard(
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
