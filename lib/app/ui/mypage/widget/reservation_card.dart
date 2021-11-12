import 'package:bpp_riverpod/app/util/text_style.dart';
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
    height: 107,
    width: 288.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: const Color(0xffdfdfdf),
    ),
    child: Center(
      child: Container(
        padding: EdgeInsets.only(left: 20.w, right: 16.w, top: 12, bottom: 12),
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
              padding: const EdgeInsets.only(bottom: 4),
              child: Column(
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
                          fontWeight: FontWeight.w700))
                ],
              ),
            ),
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
                SizedBox(
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
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
