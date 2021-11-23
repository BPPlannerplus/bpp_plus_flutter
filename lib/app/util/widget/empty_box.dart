import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/material.dart';

Widget emptyItemText() {
  return const SizedBox(
    height: 100,
    child: Center(
      child: Text(
        '아이템이 없습니다!',
        style: BppTextStyle.defaultText,
      ),
    ),
  );
}
