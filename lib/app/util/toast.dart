import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final fToast = FToast();

void showToast() {
  fToast.removeQueuedCustomToasts();
  fToast.showToast(
      child: Container(
        width: 173,
        height: 37,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(37.0),
          color: const Color(0xff595959),
        ),
        child: Center(
          child: Text(
            '찜 목록에 추가되었습니다!',
            style: BppTextStyle.smallText.copyWith(
              color: const Color(0xffffffff),
            ),
          ),
        ),
      ),
      toastDuration: const Duration(seconds: 1),
      positionedToastBuilder: (context, child) {
        return Positioned(
          top: 37,
          right: (MediaQuery.of(context).size.width - 173) / 2,
          child: child,
        );
      });
}
