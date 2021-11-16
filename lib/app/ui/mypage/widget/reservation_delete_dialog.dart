import 'package:bpp_riverpod/app/provider/mypage/confirmed_provider.dart';
import 'package:bpp_riverpod/app/ui/mypage/widget/reservation_detail_dialog.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

reservationDeleteDialog(int id, BuildContext context) {
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
                              id, navigator.navigatorKey.currentContext!);
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
                      Consumer(builder: (context, ref, _) {
                        return InkWell(
                          onTap: () async {
                            await ref
                                .read(confirmedListProvider.notifier)
                                .deleteById(id);
                            navigator.pop();
                            ref
                                .read(confirmedListProvider.notifier)
                                .changeState(id);
                          },
                          child: Text(
                            '삭제',
                            style: BppTextStyle.defaultText.copyWith(
                              fontWeight: FontWeight.w700,
                              color: const Color(0xff3b75ff),
                              fontSize: 16,
                            ),
                          ),
                        );
                      }),
                    ],
                  );
                }),
              ],
            ),
          ),
        );
      });
}
