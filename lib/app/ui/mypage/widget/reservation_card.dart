import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget reservationCard({
  required String date,
  required String shop,
  required String shopName,
  required String buttonText,
  required Widget iconWidget,
  required Function onTabButton,
  required Function onTabIcon,
}) {
  return Container(
    height: 107.h,
    width: 288.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: const Color(0xffdfdfdf),
    ),
    child: Center(
      child: Container(
        padding:
            EdgeInsets.only(left: 20.w, right: 4.w, top: 12.h, bottom: 16.h),
        height: 105.h,
        width: 286.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xffffffff),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(date, style: BppTextStyle.defaultText),
                  Text(shop,
                      style: BppTextStyle.smallText
                          .copyWith(color: const Color(0xff696969))),
                  Text(shopName,
                      style: BppTextStyle.defaultText.copyWith(
                          color: const Color(0xff010101),
                          fontWeight: FontWeight.w600))
                ]),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    onTabIcon();
                  },
                  child: iconWidget,
                ),
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
                        elevation: 0,
                      ),
                      child: Text(
                        buttonText,
                        style: BppTextStyle.smallText.copyWith(
                            color: const Color(0xff595959), fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
