import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget bppAlertDialog({
  required String title,
  required Function confirm,
}) {
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    child: Container(
      padding: const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 16),
      width: 264,
      height: 117.84,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: BppTextStyle.defaultText,
          ),
          Container(
            width: 232,
            height: 1,
            color: const Color(0xffbfbfbf),
          ),
          Consumer(
            builder: (context, ref, _) {
              return InkWell(
                onTap: () {
                  confirm();
                  ref.read(navigatorProvider).pop();
                },
                child: Text(
                  '확인',
                  style: BppTextStyle.smallText.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            },
          )
        ],
      ),
    ),
  );
}
