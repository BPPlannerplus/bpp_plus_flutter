import 'package:bpp_riverpod/app/model/shop/shop_data.dart';
import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/ui/components/card/cached_image_card.dart';
import 'package:bpp_riverpod/app/util/enum.dart';
import 'package:bpp_riverpod/app/util/format.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/theme/color.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudioCard extends StatelessWidget {
  const StudioCard({
    Key? key,
    required this.shopData,
    required this.setLike,
    required this.index,
    required this.detailPageCallback,
  }) : super(key: key);

  final ShopData shopData;
  final Function setLike;
  final void Function(int index, bool like) detailPageCallback;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
            height: 112.h,
            width: 160.w,
            child: Stack(alignment: Alignment.bottomRight, children: [
              Consumer(builder: (context, ref, _) {
                final navigator = ref.watch(navigatorProvider);
                return InkWell(
                  onTap: () async {
                    final like = await navigator.navigateTo(
                        routeName: AppRoutes.detailPage, argument: shopData.id);
                    detailPageCallback(index, like);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: BppColor.black),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedImageCard(
                        imageUrl: shopData.profile,
                        height: 112.h,
                        width: 160.w,
                      ),
                    ),
                  ),
                );
              }),
              Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                      onTap: () {
                        setLike();
                      },
                      child: Icon(
                          shopData.like
                              ? CupertinoIcons.heart_fill
                              : CupertinoIcons.heart,
                          color: shopData.like ? BppColor.like : BppColor.white,
                          size: 30)))
            ])),
        const SizedBox(height: 8),
        Text(shopData.name, style: BppTextStyle.isEng(shopData.name)),
        const SizedBox(height: 4),
        Text(shopAddrToKR[shopData.address]!,
            style: BppTextStyle.smallText.copyWith(color: BppColor.unSelText)),
        const SizedBox(height: 4),
        shopData.minPrice != null
            ? Text(priceFormat(shopData.minPrice!),
                style: BppTextStyle.smallText)
            : const Text('가격 정보 없음', style: BppTextStyle.smallText),
      ],
    );
  }
}
