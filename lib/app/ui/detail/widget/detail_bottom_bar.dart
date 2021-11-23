import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget detailBottomBar({
  required Function onTabIcon,
  required Function onTabButton,
  required bool isLike,
}) {
  return Container(
    padding: const EdgeInsets.only(right: 16, left: 16),
    height: 68,
    width: double.infinity,
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () {
            onTabIcon();
          },
          child: Stack(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffe6e6e6),
                ),
              ),
              Positioned(
                top: 1,
                left: 1,
                child: Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Icon(
                    isLike ? Icons.favorite : Icons.favorite_border_outlined,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 44,
          width: 272.w,
          child: ElevatedButton(
            onPressed: () {
              onTabButton();
            },
            style: ElevatedButton.styleFrom(
              primary: const Color(0xFF3b75ff),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
            child: Center(
              child: Text(
                '예약 및 문의하기',
                style: BppTextStyle.defaultText.copyWith(
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
