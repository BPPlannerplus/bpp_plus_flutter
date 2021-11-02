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
  inputDecorationTheme: const InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xffe6e6e6),
      ),
    ),
    border: OutlineInputBorder(
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
