import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:bpp_riverpod/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

reservationDetailDialog() {
  showCupertinoDialog(
      context: locator<NavigationService>().navigatorKey.currentContext!,
      builder: (context) {
        return Dialog(
          child: Container(
            padding: const EdgeInsets.all(16),
            width: 296,
            height: 178,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '9월 27일',
                      style: BppTextStyle.defaultText,
                    ),
                    InkWell(
                      onTap: () {
                        locator<NavigationService>().pop();
                      },
                      child: const Icon(
                        CupertinoIcons.xmark,
                        color: Color(0xffbfbfbf),
                      ),
                    ),
                  ],
                ),
                Text(
                  '태닝샵',
                  style: BppTextStyle.smallText.copyWith(
                    color: const Color(0xff696969),
                  ),
                ),
                Text(
                  '스티븐백',
                  style: BppTextStyle.defaultText.copyWith(
                    color: const Color(0xff010101),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xfff2f2f2),
                        elevation: 0,
                      ),
                      child: Text(
                        '예약 날짜 변경',
                        style: BppTextStyle.smallText.copyWith(
                          color: const Color(0xff595959),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        reservationDeleteDialog();
                      },
                      child: SvgPicture.asset(
                        'assets/icon/ic_remove.svg',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      });
}

reservationDeleteDialog() {
  showCupertinoDialog(
      context: locator<NavigationService>().navigatorKey.currentContext!,
      builder: (context) {
        return Dialog(
          child: Container(
            padding: const EdgeInsets.all(16),
            width: 296,
            height: 143,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '일정을 삭제하시겠습니까?',
                  style: BppTextStyle.defaultText.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '한번 지우면 복구하기 어려울 수 있습니다.',
                  style: BppTextStyle.smallText.copyWith(),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Text(
                        '취소',
                        style: BppTextStyle.defaultText.copyWith(
                          fontWeight: FontWeight.w700,
                          color: const Color(0xffbfbfbf),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        '삭제',
                        style: BppTextStyle.defaultText.copyWith(
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff3b75ff),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      });
}
