import 'package:bpp_riverpod/app/util/theme/color.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  primaryColor: BppColor.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: BppColor.white,
    elevation: 0,
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: BppColor.black,
  ),
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: BppColor.textFormBorder,
      ),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: BppColor.textFormBorder,
      ),
    ),
    hintStyle: BppTextStyle.smallText.copyWith(
      color: BppColor.unSelButtonText,
    ),
    border: const OutlineInputBorder(
      borderSide: BorderSide(
        color: BppColor.textFormBorder,
      ),
    ),
  ),
  canvasColor: BppColor.white,
  scaffoldBackgroundColor: BppColor.white,
  backgroundColor: BppColor.white,
  fontFamily: 'Noto_Sans',
);

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
