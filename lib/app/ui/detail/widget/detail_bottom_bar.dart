import 'package:bpp_riverpod/app/util/theme/color.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
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
    color: BppColor.white,
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
                  color: BppColor.textFormBorder,
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
                    color: BppColor.white,
                  ),
                  child: Icon(
                    isLike ? Icons.favorite : Icons.favorite_border_outlined,
                    color: BppColor.like,
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
              primary: BppColor.main,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
            child: Center(
              child: Text(
                '예약 및 문의하기',
                style: BppTextStyle.defaultText.copyWith(
                  color: BppColor.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
