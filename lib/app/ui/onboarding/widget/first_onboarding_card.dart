import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FirstOnboardingCard extends StatelessWidget {
  const FirstOnboardingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '내게 필요한 샵들을\n한번에 둘러보세요',
          style: BppTextStyle.bigScreenText.copyWith(
            height: 1.3,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40),
        Image.asset(
          'assets/image/onboarding_img1.png',
          width: double.infinity,
          height: 338.h,
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}
