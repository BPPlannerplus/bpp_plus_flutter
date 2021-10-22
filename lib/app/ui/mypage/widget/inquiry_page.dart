import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InquiryPage extends StatelessWidget {
  const InquiryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return emptyBox();
  }

  Widget inquiryList() {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 188,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            color: Colors.lightGreen[100 * (index % 9)],
            child: Text(
              'Inquiry Item ${index + 1}',
              style: const TextStyle(fontSize: 20),
            ),
          );
        },
        childCount: 100,
      ),
    );
  }

  Widget inquiryCard() {
    return SizedBox(
      height: 89,
      width: 327,
      child: Row(
        children: [
          CircleAvatar(
            radius: 32,
            child: Image.network(
              'https://png.pngtree.com/png-clipart/20200727/original/pngtree-photography-studio-logo-template-png-image_5392695.jpg',
            ),
          ),
        ],
      ),
    );
  }

  Widget emptyBox() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(top: 70.h),
        child: Center(
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/image/inquiry_none.svg',
                width: 221.w,
                height: 154.h,
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  '스튜디오 보러가기',
                  style: BppTextStyle.defaultText.copyWith(
                    color: const Color(0xffffffff),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
