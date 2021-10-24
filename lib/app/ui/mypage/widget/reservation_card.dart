import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    height: 105,
    width: 288,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: const Color(0xffdfdfdf),
    ),
    child: Center(
      child: Container(
        padding: const EdgeInsets.only(top: 8, left: 20, right: 8),
        height: 103,
        width: 286,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xffffffff),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date,
                  style: BppTextStyle.defaultText,
                ),
                Text(
                  shop,
                  style: BppTextStyle.smallText.copyWith(
                    color: const Color(0xff696969),
                  ),
                ),
                Text(
                  shopName,
                  style: BppTextStyle.defaultText.copyWith(
                    color: const Color(0xff010101),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    onTabIcon;
                  },
                  child: iconWidget,
                ),
                ElevatedButton(
                  onPressed: () {
                    onTabButton;
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xfff2f2f2),
                    elevation: 0,
                  ),
                  child: Text(
                    buttonText,
                    style: BppTextStyle.smallText.copyWith(
                      color: const Color(0xff595959),
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
