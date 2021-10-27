import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:bpp_riverpod/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({Key? key}) : super(key: key);

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
            child: const Icon(
              Icons.arrow_back,
              color: Color(0xff000000),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '신고하시는 이유를 선택해주세요',
                  style: BppTextStyle.tabText,
                ),
                reportRow('음란, 욕설 등 부적절한 내용', true),
                reportRow('부적절한 홍보 또는 광고 내용', true),
                reportRow('개인 정보 노출', false),
                reportRow('불법 정보 기재', false),
                reportRow('기타(직접 입력)', false),
                const SizedBox(
                  height: 128,
                  child: TextField(
                    maxLines: 8,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 56,
                  width: double.infinity,
                  color: Colors.grey.shade200,
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/image/report_text.svg',
                      height: 25.h,
                    ),
                  ),
                ),
                const SizedBox(height: 100),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                      (states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.grey;
                        }
                        return Colors.black;
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
                          color: Colors.white,
                          fontSize: BppTextStyle.tabText.fontSize!.sp,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget reportRow(String title, bool isCheck) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            SvgPicture.asset(
              isCheck
                  ? 'assets/icon/ic_check_on.svg'
                  : 'assets/icon/ic_check_none.svg',
              width: 32,
              height: 32,
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
      ),
    );
  }
}
