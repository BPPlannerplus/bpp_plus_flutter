import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget reportRow({
  required int index,
  required bool check,
  required String title,
  required Function checking,
}) {
  return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(children: [
        InkWell(
          onTap: () {
            checking();
          },
          borderRadius: BorderRadius.circular(16),
          child: SvgPicture.asset(
            check
                ? 'assets/icon/ic_check_on.svg'
                : 'assets/icon/ic_check_none.svg',
            width: 32,
            height: 32,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: BppTextStyle.smallText,
        )
      ]));
}
