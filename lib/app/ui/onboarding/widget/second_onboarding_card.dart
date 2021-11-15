import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SecondOnboardingCard extends StatelessWidget {
  const SecondOnboardingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/image/onboarding_text2.svg',
          width: 188.w,
        ),
        const SizedBox(height: 40),
        Image.asset(
          'assets/image/onboarding_img2.png',
        ),
      ],
    );
  }
}
