import 'package:bpp_riverpod/app/model/shop/shop_data.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_state.dart';
import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/util/format.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget homeGridCard({
  required ShopData shop,
  required ShopListState shopState,
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
              child: InkWell(
                onTap: () {
                  shopState.setLike(shop.id, shop.like);
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
      const SizedBox(height: 8),
      Text(
        shop.name,
        style: !BppTextStyle.isEng(shop.name)
            ? BppTextStyle.tabText
            : BppTextStyle.engShopNameText,
      ),
      const SizedBox(height: 2),
      Text(
        shop.address,
        style: BppTextStyle.smallText,
      ),
      const SizedBox(height: 2),
      shop.minPrice != null
          ? Text(
              priceFormat(shop.minPrice!),
              style: BppTextStyle.smallText,
            )
          : const Text(
              '가격 정보 없음',
              style: BppTextStyle.smallText,
            ),
    ],
  );
}
