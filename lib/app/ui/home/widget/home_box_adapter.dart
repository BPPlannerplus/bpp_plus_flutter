import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeBoxAdpater extends StatelessWidget {
  const HomeBoxAdpater({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(top: 64),
        height: 151,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/image/home_sub.svg', width: 113.w),
            const SizedBox(height: 10),
            SvgPicture.asset('assets/image/home_title.svg', width: 154.w),
          ],
        ),
      ),
    );
  }
}
