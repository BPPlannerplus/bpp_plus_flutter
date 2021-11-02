import 'package:bpp_riverpod/app/provider/report_provider.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:bpp_riverpod/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            '리뷰 신고하기',
            style: BppTextStyle.defaultText,
          ),
          leading: InkWell(
            onTap: () {
              locator<NavigationService>().pop();
            },
            child: SvgPicture.asset(
              'assets/icon/ic_back.svg',
              color: const Color(0xff000000),
              width: 20,
              height: 20,
            ),
          ),
          toolbarHeight: 40,
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '신고하시는 이유를 선택해주세요',
                    style: BppTextStyle.tabText,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  reportRow('음란, 욕설 등 부적절한 내용', 0),
                  reportRow('부적절한 홍보 또는 광고 내용', 1),
                  reportRow('개인 정보 노출', 2),
                  reportRow('불법 정보 기재', 3),
                  reportRow('기타(직접 입력)', 4),
                  const SizedBox(
                    height: 128,
                    child: TextField(
                      maxLines: 8,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '신고하시는 이유를 입력해주세요',
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Container(
                    height: 56,
                    width: double.infinity,
                    color: Colors.grey.shade200,
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/image/report_text.svg',
                        width: 312.w,
                      ),
                    ),
                  ),
                ],
              ),
              Consumer(builder: (context, ref, _) {
                final check = ref.watch(isReportCheckProvider(id));
                return ElevatedButton(
                  onPressed: check
                      ? () {
                          locator<NavigationService>().pop();
                        }
                      : null,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                      (states) {
                        if (states.contains(MaterialState.disabled)) {
                          return const Color(0xfff2f2f2);
                        }
                        return const Color(0xff000000);
                      },
                    ),
                  ),
                  child: SizedBox(
                    width: 328.w,
                    height: 48.h,
                    child: Center(
                      child: Text(
                        '신고하기',
                        style: BppTextStyle.tabText.copyWith(
                          color: check
                              ? const Color(0xffffffff)
                              : const Color(0xffbfbfbf),
                          fontSize: BppTextStyle.tabText.fontSize!.sp,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget reportRow(String title, int index) {
    return Consumer(builder: (context, ref, _) {
      final checks = ref.watch(reportCheckProvider(id));
      return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                ref.read(reportCheckProvider(id).notifier).checking(index);
              },
              borderRadius: BorderRadius.circular(16),
              child: SvgPicture.asset(
                checks[index]
                    ? 'assets/icon/ic_check_on.svg'
                    : 'assets/icon/ic_check_none.svg',
                width: 32,
                height: 32,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: BppTextStyle.smallText,
            ),
          ],
        ),
      );
    });
  }
}
