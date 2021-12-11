import 'dart:developer' as dp;

import 'package:bpp_riverpod/app/model/shop/shop_data.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_page_controller_provider.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_provider.dart';
import 'package:bpp_riverpod/app/ui/components/state/custom_load_indicator.dart';
import 'package:bpp_riverpod/app/ui/components/state/empty_item_text.dart';
import 'package:bpp_riverpod/app/ui/home/widget/home_grid_card.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:bpp_riverpod/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class StudioGrid extends ConsumerStatefulWidget {
  const StudioGrid({Key? key}) : super(key: key);

  @override
  ConsumerState<StudioGrid> createState() => _StudioGridState();
}

class _StudioGridState extends ConsumerState<StudioGrid> {
  final FToast fToast = FToast();

  @override
  void initState() {
    fToast.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PagedSliverGrid(
      pagingController: ref.watch(studioPageControllerProvider),
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
          final studios = ref.watch(studioListProvider);

          return HomeGridCard(
            shop: studios.shopDatas[index],
            setLike: () async {
              if (!studios.shopDatas[index].like) {
                _showToast();
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

  void _showToast() {
    fToast.removeCustomToast();
    fToast.showToast(
        child: Container(
            width: 173,
            height: 37,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(37.0),
                color: const Color(0xff595959)),
            child: Center(
                child: Text('찜 목록에 추가되었습니다!',
                    style: BppTextStyle.smallText
                        .copyWith(color: const Color(0xffffffff))))),
        toastDuration: const Duration(milliseconds: 500),
        positionedToastBuilder: (context, child) {
          return Positioned(
              top: 37,
              right: (MediaQuery.of(context).size.width - 173) / 2,
              child: child);
        });
  }
}
