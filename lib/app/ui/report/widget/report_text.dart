import 'package:bpp_riverpod/app/util/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReportText extends StatelessWidget {
  const ReportText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color(0xfff8f8f8),
      ),
      child: const Center(
        child: Text(
          '허위 신고 시 서비스 활동이 제한 될 수 있으니 신중하게\n신고해주시기 바랍니다.',
          style: TextStyle(
            fontSize: 13,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            height: 1.5,
            color: BppColor.unSelText,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
