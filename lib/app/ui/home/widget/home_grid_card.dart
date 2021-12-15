import 'package:bpp_riverpod/app/model/shop/shop_data.dart';
import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/util/enum.dart';
import 'package:bpp_riverpod/app/util/format.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/theme/color.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeGridCard extends StatelessWidget {
  const HomeGridCard({
    Key? key,
    required this.shop,
    required this.setLike,
  }) : super(key: key);

  final ShopData shop;
  final Function setLike;

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
                      await navigator.navigateTo(
                          routeName: AppRoutes.detailPage, argument: shop.id);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: BppColor.black),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(shop.profile,
                                height: 112.h,
                                width: 160.w,
                                fit: BoxFit.contain))));
              }),
              Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                      onTap: () {
                        setLike();
                      },
                      child: Icon(
                          shop.like
                              ? CupertinoIcons.heart_fill
                              : CupertinoIcons.heart,
                          color: shop.like ? BppColor.like : BppColor.white,
                          size: 30)))
            ])),
        const SizedBox(height: 8),
        Text(shop.name, style: BppTextStyle.isEng(shop.name)),
        const SizedBox(height: 4),
        Text(shopAddrToKR[shop.address]!,
            style: BppTextStyle.smallText.copyWith(color: BppColor.unSelText)),
        const SizedBox(height: 4),
        shop.minPrice != null
            ? Text(priceFormat(shop.minPrice!), style: BppTextStyle.smallText)
            : const Text('가격 정보 없음', style: BppTextStyle.smallText),
      ],
    );
  }
}
