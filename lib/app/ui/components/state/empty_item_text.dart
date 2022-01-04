import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/material.dart';

Widget emptyItemText(String title) {
  return Center(
    child: Text(
      title,
      style: BppTextStyle.defaultText,
    ),
  );
}
