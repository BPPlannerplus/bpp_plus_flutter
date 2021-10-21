import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBoxAdpater extends StatelessWidget {
  const HomeBoxAdpater({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(top: 56),
        height: 151,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '스튜디오 찾으세요?',
              style: TextStyle(
                fontSize: 16.sp,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              '한 눈에 확인하고\n비교해보세요!',
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
