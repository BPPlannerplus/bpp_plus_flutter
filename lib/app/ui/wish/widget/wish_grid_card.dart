import 'package:bpp_riverpod/app/model/shop/shop_data.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_provider.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_state.dart';
import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/util/format.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget wishGridCard({
  required ShopData shop,
  required ShopDataState stateRead,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(
        height: 112,
        width: 160.w,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Consumer(builder: (context, ref, _) {
              final navigator = ref.watch(navigatorProvider);
              return InkWell(
                onTap: () {
                  navigator.navigateTo(
                    routeName: AppRoutes.detailPage,
                    argument: shop.id,
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    shop.profile,
                    height: 112,
                    width: 160.w,
                    fit: BoxFit.fill,
                  ),
                ),
              );
            }),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Consumer(builder: (context, ref, _) {
                return InkWell(
                  onTap: () {
                    stateRead.setLike(shop.id);
                    ref.read(shopWishListProvider).setLike(shop.id);
                  },
                  child: Icon(
                    shop.like
                        ? CupertinoIcons.heart_fill
                        : CupertinoIcons.heart,
                    color: shop.like
                        ? const Color(0xffff5757)
                        : const Color(0xffffffff),
                    size: 30,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
      const SizedBox(height: 8),
      Text(
        shop.name,
        style: !BppTextStyle.isEng(shop.name)
            ? BppTextStyle.tabText
            : BppTextStyle.engShopNameText,
      ),
      Text(
        shop.address,
        style: BppTextStyle.smallText,
      ),
      Text(
        priceFormat(shop.minPrice ?? 1000000),
        style: BppTextStyle.smallText,
      ),
    ],
  );
}
