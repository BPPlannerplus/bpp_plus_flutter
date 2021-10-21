import 'package:bpp_riverpod/app/model/shop_detail_data.dart';
import 'package:bpp_riverpod/app/provider/studio_provider.dart';
import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 112,
                width: 160.w,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.detailPage,
                          arguments: DetailIndex(
                            index: index,
                            shopId: ref
                                .read(studioListProvider)
                                .shopDatas[index]
                                .id,
                          ),
                        );
                      },
                      child: Image.network(
                        studioList.shopDatas[index].profile,
                        height: 112,
                        width: 160.w,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                        onTap: () {
                          ref
                              .read(studioListProvider.notifier)
                              .setShopLike(index);
                        },
                        child: Icon(
                          studioList.shopDatas[index].like
                              ? CupertinoIcons.heart_fill
                              : CupertinoIcons.heart,
                          color: studioList.shopDatas[index].like
                              ? const Color(0xffff5757)
                              : const Color(0xffffffff),
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                studioList.shopDatas[index].name,
                style: BppTextStyle.tabText,
              ),
              Text(
                studioList.shopDatas[index].address,
                style: BppTextStyle.smallText,
              ),
              Text(
                '${studioList.shopDatas[index].minPrice}',
                style: BppTextStyle.smallText,
              ),
            ],
          );
        },
        childCount:
            studioList.shopDatas.length + (studioList.next!.isNotEmpty ? 1 : 0),
      ),
    );
  }
}
