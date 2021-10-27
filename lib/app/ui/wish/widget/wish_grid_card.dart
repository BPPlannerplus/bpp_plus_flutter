import 'package:bpp_riverpod/app/model/shop_data.dart';
import 'package:bpp_riverpod/app/provider/shop_state.dart';
import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/util/format.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:bpp_riverpod/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget wishGridCard({
  required ShopData shop,
  required ShopState stateRead,
}) {
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
                locator<NavigationService>().navigateTo(
                  routeName: AppRoutes.detailPage,
                  argument: shop.id,
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  shop.profile,
                  height: 112.h,
                  width: 160.w,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                onTap: () {
                  stateRead.setLike(shop.id);
                },
                child: Icon(
                  shop.like ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                  color: shop.like
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
        shop.name,
        style: BppTextStyle.tabText,
      ),
      Text(
        shop.address,
        style: BppTextStyle.smallText,
      ),
      Text(
        priceFormat(shop.minPrice),
        style: BppTextStyle.smallText,
      ),
    ],
  );
}
