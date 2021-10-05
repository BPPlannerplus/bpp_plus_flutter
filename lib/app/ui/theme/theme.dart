import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final ThemeData themeData = ThemeData(
  fontFamily: 'Noto_Sans',
  textTheme: TextTheme(
    // 큰 화면 문구
    headline1: TextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeight.w600,
    ),
    // 화면 문구
    headline2: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    // 탭 및 필터 강조
    subtitle1: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
    ),
    // 작은 글씨, 업체 종류
    bodyText1: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    ),
    // 기본 본문, 날짜
    bodyText2: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
    ),
    // 필터 칩, 작은 글씨
    caption: TextStyle(
      fontSize: 13.sp,
      fontWeight: FontWeight.w400,
    ),
  ),
  backgroundColor: Colors.white,
);
