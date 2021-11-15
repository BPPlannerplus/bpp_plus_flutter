import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FirstOnboardingCard extends StatelessWidget {
  const FirstOnboardingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/image/onboarding_text1.svg',
          width: 188.w,
        ),
        const SizedBox(height: 40),
        Image.asset(
          'assets/image/onboarding_img1.png',
        ),
      ],
    );
  }
}
