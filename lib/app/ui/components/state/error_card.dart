import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/material.dart';

Widget errorCard() {
  return const Center(
    child: Text(
      '아이템을 불러 올 수 없습니다.\n\n다시 시도해주세요!',
      style: BppTextStyle.defaultText,
    ),
  );
}
