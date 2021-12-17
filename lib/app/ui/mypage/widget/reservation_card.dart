import 'dart:math';

import 'package:bpp_riverpod/app/model/enum/shop_type.dart';
import 'package:bpp_riverpod/app/model/mypage/mypage_data.dart';
import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/util/format.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget reservationCard({
  required MypageData mypageData,
  required String buttonText,
  required Widget iconWidget,
  required Function onTabButton,
  required Function onTabIcon,
}) {
  return Container(
      height: 107,
      width: 288.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xffdfdfdf),
      ),
      child: Center(
          child: Container(
              padding:
                  EdgeInsets.only(left: 20.w, right: 4.w, top: 8, bottom: 16),
              height: 105,
              width: 286.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xffffffff),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4, bottom: 0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                reservationDateFormat(mypageData.reservedData!),
                                style: BppTextStyle.defaultText),
                            Text(shopTypeToString(mypageData.shop.type),
                                style: BppTextStyle.smallText
                                    .copyWith(color: const Color(0xff696969))),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  mypageData.shop.name,
                                  style:
                                      BppTextStyle.isEng(mypageData.shop.name)
                                          .copyWith(
                                              color: const Color(0xff010101)),
                                ),
                                const SizedBox(width: 4),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2),
                                  child: Consumer(builder: (context, ref, _) {
                                    return InkWell(
                                        onTap: () {
                                          ref
                                              .read(navigatorProvider)
                                              .navigateTo(
                                                routeName: AppRoutes.detailPage,
                                                argument: mypageData.shop.id,
                                              );
                                        },
                                        child: Transform.rotate(
                                            angle: pi,
                                            child: const Icon(
                                                Icons.arrow_back_ios_new,
                                                color: Color(0xff000000),
                                                size: 13)));
                                  }),
                                ),
                              ],
                            )
                          ]),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InkWell(
                              onTap: () {
                                onTabIcon();
                              },
                              child: iconWidget),
                          Padding(
                              padding: EdgeInsets.only(right: 12.w),
                              child: SizedBox(
                                  height: 33,
                                  width: buttonText == '내 리뷰 보기' ? 104 : 88,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        onTabButton();
                                      },
                                      style: ElevatedButton.styleFrom(
                                          primary: const Color(0xfff2f2f2),
                                          elevation: 0),
                                      child: Text(buttonText,
                                          style: BppTextStyle.smallText
                                              .copyWith(
                                                  color: const Color(
                                                      0xff595959))))))
                        ])
                  ]))));
}
