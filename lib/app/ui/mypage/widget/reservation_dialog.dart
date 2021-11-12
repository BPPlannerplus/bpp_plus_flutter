import 'package:bpp_riverpod/app/ui/mypage/widget/mypage_dialog.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

reservationDetailDialog(BuildContext context) {
  showCupertinoDialog(
      context: context,
      builder: (context) {
        return Consumer(builder: (context, ref, _) {
          final navigator = ref.watch(navigatorProvider);
          return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                  padding: const EdgeInsets.only(
                      top: 20, left: 24, right: 24, bottom: 10),
                  width: 296,
                  height: 178,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('9월 27일', style: BppTextStyle.defaultText),
                            InkWell(
                              onTap: () {
                                navigator.pop();
                              },
                              child: const Icon(
                                CupertinoIcons.xmark,
                                color: Color(0xffbfbfbf),
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text('태닝샵',
                            style: BppTextStyle.smallText
                                .copyWith(color: const Color(0xff696969))),
                        const SizedBox(height: 4),
                        Text('스티븐백',
                            style: BppTextStyle.defaultText.copyWith(
                                color: const Color(0xff010101),
                                fontWeight: FontWeight.w700)),
                        const SizedBox(height: 16),
                        Row(children: [
                          ElevatedButton(
                              onPressed: () {
                                navigator.pop();
                                reservationDateDialog(
                                    navigator.navigatorKey.currentContext!);
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: const Color(0xff3b75ff),
                                  elevation: 0),
                              child: Text('예약 날짜 변경',
                                  style: BppTextStyle.smallText.copyWith(
                                      color: const Color(0xffffffff)))),
                          const SizedBox(width: 5),
                          InkWell(
                            onTap: () {
                              navigator.pop();
                              reservationDeleteDialog(
                                  navigator.navigatorKey.currentContext!);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color(0xfff2f2f2),
                              ),
                              child: SvgPicture.asset(
                                'assets/icon/ic_remove.svg',
                              ),
                            ),
                          )
                        ])
                      ])));
        });
      });
}

reservationDeleteDialog(BuildContext context) {
  showCupertinoDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            padding: const EdgeInsets.all(24),
            width: 296,
            height: 143,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '일정을 삭제하시겠습니까?',
                  style: BppTextStyle.defaultText.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                Text(
                  '한번 지우면 복구하기 어려울 수 있습니다.',
                  style: BppTextStyle.smallText.copyWith(fontSize: 14),
                ),
                Consumer(builder: (context, ref, _) {
                  final navigator = ref.watch(navigatorProvider);
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          navigator.pop();
                          reservationDetailDialog(
                              navigator.navigatorKey.currentContext!);
                        },
                        child: Text(
                          '취소',
                          style: BppTextStyle.defaultText.copyWith(
                            fontWeight: FontWeight.w700,
                            color: const Color(0xffbfbfbf),
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          navigator.pop();
                        },
                        child: Text(
                          '삭제',
                          style: BppTextStyle.defaultText.copyWith(
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff3b75ff),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
        );
      });
}
