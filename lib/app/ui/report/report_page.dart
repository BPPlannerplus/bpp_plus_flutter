import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: const [
                    Icon(Icons.arrow_back),
                    Text(
                      '리뷰 신고하기',
                      style: BppTextStyle.defaultText,
                    ),
                  ],
                ),
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
                  child: const Center(
                    child: Text(
                      '허위 신고 시 서비스 활동이 제한 될 수 있으니 신중하게\n신고해주시기 바랍니다.',
                      style: BppTextStyle.smallText,
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
                    width: 328,
                    height: 48,
                    child: Center(
                      child: Text(
                        '신고하기',
                        style: BppTextStyle.tabText.copyWith(
                          color: Colors.white,
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
    return Row(
      children: [
        Icon(
          Icons.circle_notifications,
          color: isCheck ? Colors.black : Colors.purple,
        ),
        Text(
          title,
          style: BppTextStyle.filterText,
        ),
      ],
    );
  }
}
