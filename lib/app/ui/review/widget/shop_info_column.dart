import 'dart:math';

import 'package:bpp_riverpod/app/model/enum/shop_type.dart';
import 'package:bpp_riverpod/app/model/mypage/mypage_shop_data.dart';
import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/theme/color.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopInfoColumn extends StatelessWidget {
  const ShopInfoColumn({Key? key, required this.shopData}) : super(key: key);

  final MypageShopData shopData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          shopTypeToString(shopData.type),
          style:
              BppTextStyle.smallText.copyWith(color: const Color(0xff4d4d4d)),
        ),
        SizedBox(height: 5.h),
        Row(
          children: [
            Text(
              shopData.name,
              style: BppTextStyle.tabText,
            ),
            const SizedBox(width: 8),
            Consumer(builder: (context, ref, _) {
              return InkWell(
                onTap: () {
                  ref.read(navigatorProvider).navigateTo(
                        routeName: AppRoutes.detailPage,
                        argument: shopData.id,
                      );
                },
                child: Transform.rotate(
                  angle: pi,
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Color(0xff000000),
                    size: 18,
                  ),
                ),
              );
            }),
          ],
        ),
        const SizedBox(height: 16),
        Container(height: 1, color: BppColor.textFormBorder),
        const SizedBox(height: 24),
        Text(
          '만족스러우셨나요?\n경험을 공유해주세요!',
          style: BppTextStyle.tabText.copyWith(height: 1.4),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
