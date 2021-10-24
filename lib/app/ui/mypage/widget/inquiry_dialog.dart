import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:bpp_riverpod/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

reservationDateDialog() {
  showCupertinoDialog(
    context: locator<NavigationService>().navigatorKey.currentContext!,
    builder: (context) {
      return Dialog(
        child: Container(
          padding: const EdgeInsets.all(16),
          width: 296.w,
          height: 225.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Text(
                '예약 날짜',
                style: BppTextStyle.dialogText.copyWith(
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              DateTimePickerWidget(
                minDateTime: DateTime(DateTime.now().year),
                maxDateTime: DateTime(2100),
                locale: DateTimePickerLocale.ko,
                initDateTime: DateTime.now(),
                dateFormat: 'yyyy-MM-dd',
                pickerTheme: DateTimePickerTheme(
                  showTitle: false,
                  pickerHeight: 106.h,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Container(
                width: 248.w,
                height: 1,
                color: const Color(0xffbfbfbf),
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      locator<NavigationService>().pop();
                    },
                    child: Text(
                      '취소',
                      style: BppTextStyle.tabText.copyWith(
                        color: const Color(0xffbfbfbf),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  InkWell(
                    onTap: () {
                      locator<NavigationService>().pop();
                      confirmReservationDialog();
                    },
                    child: Text(
                      '저장',
                      style: BppTextStyle.tabText.copyWith(
                        color: const Color(0xff3575ff),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

confirmReservationDialog() {
  showCupertinoDialog(
    context: locator<NavigationService>().navigatorKey.currentContext!,
    builder: (context) {
      return Dialog(
        child: Container(
          padding: const EdgeInsets.all(16),
          width: 264.w,
          height: 117.84.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                '일정이 저장되었습니다!',
                style: BppTextStyle.defaultText,
              ),
              Container(
                width: 232.w,
                height: 1,
                color: const Color(0xffbfbfbf),
              ),
              InkWell(
                onTap: () {
                  locator<NavigationService>().pop();
                },
                child: Text(
                  '확인',
                  style: BppTextStyle.smallText.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
