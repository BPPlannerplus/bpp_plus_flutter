import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BppTextStyle {
  static final bigScreenText = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w600,
    color: const Color(0xff000000),
  );
  static final screenText = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    color: const Color(0xff000000),
  );
  static final dialogText = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: const Color(0xffffffff),
  );
  static final tabText = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: const Color(0xff000000),
  );
  static final defaultText = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: const Color(0xff000000),
  );
  static final smallText = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: const Color(0xff000000),
  );
  static final filterText = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: const Color(0xff000000),
  );
  static final engShopNameText = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: const Color(0xff000000),
    fontFamily: 'Roboto',
  );

  static bool isEng(String str) {
    if (str.startsWith(RegExp(r'[a-zA-Z]'))) {
      return true;
    } else {
      return false;
    }
  }
}
