import 'package:flutter/material.dart';

class BppTextStyle {
  static const bigScreenText = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: Color(0xff000000),
  );
  static const screenText = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: Color(0xff000000),
  );
  static const dialogText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Color(0xffffffff),
  );
  static const tabText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Color(0xff000000),
  );
  static const defaultText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Color(0xff000000),
  );
  static const smallText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Color(0xff000000),
  );
  static const filterText = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: Color(0xff000000),
  );
  static const engShopNameText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Color(0xff000000),
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
