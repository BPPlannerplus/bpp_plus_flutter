import 'package:bpp_riverpod/app/model/shop/shop_data.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_provider.dart';
import 'package:bpp_riverpod/app/repository/shop_repository.dart';
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

class StudioGrid extends StatelessWidget {
  const StudioGrid({
    Key? key,
    required this.fToast,
    required this.pagingController,
  }) : super(key: key);

  final FToast fToast;
  final PagingController<int, ShopData> pagingController;

  @override
  Widget build(BuildContext context) {
    return StudioPagedSliverGrid(
      pageController: pagingController,
      builderDelegate: PagedChildBuilderDelegate<ShopData>(
        itemBuilder: (context, shop, index) {
          return Consumer(builder: (context, ref, _) {
            final stduio = ref.watch(shopProvider(shop));
            return StudioCard(
              shopData: stduio,
              setLike: () async {
                if (!stduio.like) {
                  showToast(fToast);
                }
                ref.read(shopProvider(shop).notifier).setLike();
                await ref
                    .read(shopRepositroyProvider)
                    .setLike(stduio.id, !stduio.like);
              },
              detailPageCallback:
                  ref.read(shopProvider(shop).notifier).setLikeCallback,
            );
          });
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
