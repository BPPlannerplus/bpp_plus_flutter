import 'package:bpp_riverpod/app/util/theme/color.dart';
import 'package:flutter/material.dart';

class BppTextStyle {
  static const bigScreenText = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: BppColor.black,
  );
  static const screenText = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: BppColor.black,
  );
  static const dialogText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: BppColor.white,
  );
  static const tabText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: BppColor.black,
  );
  static const defaultText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: BppColor.black,
  );
  static const smallText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: BppColor.black,
  );
  static const filterText = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: BppColor.black,
  );
  static const engShopNameText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: BppColor.black,
    fontFamily: 'Roboto',
  );

  static TextStyle isEng(String str) {
    if (str.startsWith(RegExp(r'[a-zA-Z]'))) {
      return engShopNameText;
    } else {
      return tabText;
    }
  }
}
