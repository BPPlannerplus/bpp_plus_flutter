import 'package:bpp_riverpod/app/my_cupertino_picker/flutter_cupertino_datetime_picker.dart';
import 'package:bpp_riverpod/app/ui/mypage/widget/confirm_dialog.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

setDateDialog(BuildContext context) {
  showCupertinoDialog(
    context: context,
    builder: (context) {
      return Consumer(builder: (context, ref, _) {
        final navigator = ref.watch(navigatorProvider);
        return Dialog(
          insetPadding: const EdgeInsets.all(1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            padding: const EdgeInsets.all(24),
            width: 296,
            height: 225,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '예약 날짜',
                    style: BppTextStyle.dialogText.copyWith(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 2),
                  DateTimePickerWidget(
                      minDateTime: DateTime.now(),
                      maxDateTime: DateTime(DateTime.now().year + 5),
                      locale: DateTimePickerLocale.ko,
                      initDateTime: DateTime.now(),
                      dateFormat: 'yyyy-MM-dd',
                      pickerTheme: DateTimePickerTheme(
                          showTitle: false,
                          pickerHeight: 106,
                          itemHeight: 48,
                          titleHeight: 0,
                          itemTextStyle:
                              BppTextStyle.tabText.copyWith(fontSize: 16),
                          selectionOverlay: Container(
                              decoration: const BoxDecoration(
                                  border: Border.symmetric(
                                      horizontal: BorderSide(
                                          width: 1.0,
                                          color: Color(0xff000000))))))),
                  const SizedBox(height: 8),
                  Container(
                    height: 1,
                    color: const Color(0xffbfbfbf),
                  ),
                  const SizedBox(height: 14),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    InkWell(
                        onTap: () {
                          navigator.pop();
                        },
                        child: Text('취소',
                            style: BppTextStyle.tabText.copyWith(
                                color: const Color(0xffbfbfbf),
                                fontWeight: FontWeight.w500,
                                fontSize: 16))),
                    const SizedBox(width: 12),
                    InkWell(
                        onTap: () {
                          navigator.pop();
                          confirmDialog(navigator.navigatorKey.currentContext!);
                        },
                        child: Text(
                          '저장',
                          style: BppTextStyle.tabText.copyWith(
                              color: const Color(0xff3575ff), fontSize: 16),
                        ))
                  ])
                ]),
          ),
        );
      });
    },
  );
}
