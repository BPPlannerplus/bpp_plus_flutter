import 'package:bpp_riverpod/app/ui/mypage/widget/reservation_delete_dialog.dart';
import 'package:bpp_riverpod/app/ui/mypage/widget/set_date_dialog.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

reservationDetailDialog(int id, BuildContext context) {
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
                            const Text('9월 27일',
                                style: BppTextStyle.defaultText),
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
                                setDateDialog(
                                    id, navigator.navigatorKey.currentContext!);
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
                                id,
                                navigator.navigatorKey.currentContext!,
                              );
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
