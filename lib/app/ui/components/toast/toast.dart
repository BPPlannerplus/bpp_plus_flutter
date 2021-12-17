import 'package:bpp_riverpod/app/util/theme/color.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(FToast fToast) {
  fToast.removeCustomToast();

  fToast.showToast(
      child: Container(
          width: 173,
          height: 37,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(37.0),
              color: BppColor.unSelText),
          child: Center(
              child: Text('찜 목록에 추가되었습니다!',
                  style:
                      BppTextStyle.smallText.copyWith(color: BppColor.white)))),
      toastDuration: const Duration(milliseconds: 500),
      positionedToastBuilder: (context, child) {
        return Positioned(
            top: 37,
            right: (MediaQuery.of(context).size.width - 173) / 2,
            child: child);
      });
}
