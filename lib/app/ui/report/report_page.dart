import 'package:bpp_riverpod/app/model/enum/complain_type.dart';
import 'package:bpp_riverpod/app/model/review/complain.dart';
import 'package:bpp_riverpod/app/provider/detail/complain_provider.dart';
import 'package:bpp_riverpod/app/provider/detail/report_provider.dart';
import 'package:bpp_riverpod/app/repository/shop_detail_repository.dart';
import 'package:bpp_riverpod/app/ui/components/app_bar/custom_app_bar.dart';
import 'package:bpp_riverpod/app/ui/components/button/confirm_button.dart';
import 'package:bpp_riverpod/app/ui/report/widget/report_row.dart';
import 'package:bpp_riverpod/app/ui/report/widget/report_text.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/theme/color.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({
    Key? key,
    required this.onReport,
    required this.reviewId,
  }) : super(key: key);

  final int reviewId;
  final void Function(int reviewId) onReport;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar('리뷰 신고하기'),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 24),
          child: LayoutBuilder(builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Consumer(
                  builder: (context, ref, _) {
                    final check = ref.watch(isReportCheckProvider);
                    final navigator = ref.watch(navigatorProvider);
                    final checks = ref.watch(reportCheckProvider);

                    final reason = ref.watch(complaingReasonProvider);
                    final contents = ref.watch(complaingContentsProvider);

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('신고하시는 이유를 선택해주세요',
                                style: BppTextStyle.tabText),
                            SizedBox(height: 16.h),
                            for (int i = 0; i < 5; i++)
                              reportRow(
                                  index: i,
                                  check: checks[i],
                                  title: complainTitle(i),
                                  checking: () {
                                    ref
                                        .read(reportCheckProvider.notifier)
                                        .checking(i);
                                    ref
                                        .read(
                                            complaingReasonStateProvider.state)
                                        .state = complainrReason(i);
                                  }),
                            SizedBox(
                              height: 128,
                              child: TextField(
                                maxLines: 6,
                                style: BppTextStyle.smallText,
                                decoration: const InputDecoration(
                                    hintText: '신고하시는 이유를 입력해주세요'),
                                onChanged: (text) {
                                  ref
                                      .read(
                                          complaingContentsStateProvider.state)
                                      .state = text;
                                },
                              ),
                            ),
                            SizedBox(height: 16.h),
                            reportText(),
                          ],
                        ),
                        const SizedBox(height: 70),
                        ConfirmButton(
                          buttonTitle: '신고하기',
                          onPressedButton: () async {
                            await ref.read(shopDetailRepository).reportReview(
                                  reviewId,
                                  Complain(reason: reason, contents: contents),
                                );
                            onReport(reviewId);
                            navigator.pop();
                          },
                          check: !check,
                          activeButtonColor: BppColor.black,
                        ),
                      ],
                    );
                  },
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
