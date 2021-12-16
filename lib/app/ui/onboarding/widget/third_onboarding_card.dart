import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThirdOnboardingCard extends StatelessWidget {
  const ThirdOnboardingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '나의 예약일정을\n한 곳에서 관리하세요',
          style: BppTextStyle.bigScreenText.copyWith(
            height: 1.3,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40),
        Image.asset(
          'assets/image/onboarding_img3.png',
          width: double.infinity,
          height: 338.h,
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}
