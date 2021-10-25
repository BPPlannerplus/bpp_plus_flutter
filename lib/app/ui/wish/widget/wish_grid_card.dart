import 'package:bpp_riverpod/app/provider/studio_wish_provider.dart';
import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/util/format.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:bpp_riverpod/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget wishGridCard({
  required int index,
  required int shopId,
  required String profile,
  required String name,
  required String address,
  required int minPrice,
  required bool like,
  required ShopWishListState stateRead,
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
                  argument: shopId,
                );
              },
              child: Image.network(
                profile,
                height: 112,
                width: 160.w,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                onTap: () {
                  stateRead.setShopLike(index);
                },
                child: Icon(
                  like ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                  color:
                      like ? const Color(0xffff5757) : const Color(0xffffffff),
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
      Text(
        name,
        style: BppTextStyle.tabText,
      ),
      Text(
        address,
        style: BppTextStyle.smallText,
      ),
      Text(
        priceFormat(minPrice),
        style: BppTextStyle.smallText,
      ),
    ],
  );
}
