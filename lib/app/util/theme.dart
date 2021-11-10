import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  primaryColor: const Color(0xffffffff),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xffffffff),
    elevation: 0,
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Color(0xff000000),
  ),
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xffe6e6e6),
      ),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xffe6e6e6),
      ),
    ),
    hintStyle: BppTextStyle.smallText.copyWith(
      color: const Color(0xffbfbfbf),
    ),
    border: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xffe6e6e6),
      ),
    ),
  ),
  canvasColor: const Color(0xffffffff),
  scaffoldBackgroundColor: const Color(0xffffffff),
  backgroundColor: const Color(0xffffffff),
  // fontFamily: 'Noto_Sans_KR',
  // fontFamily: 'Roboto',
  fontFamily: 'Noto_Sans',
);

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
