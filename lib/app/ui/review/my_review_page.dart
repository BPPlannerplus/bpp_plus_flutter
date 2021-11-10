import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyReviewPage extends StatelessWidget {
  const MyReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            '내 리뷰 보기',
            style: BppTextStyle.defaultText,
          ),
          leading: InkWell(
            onTap: () {
              locator<NavigationService>().pop();
            },
            child: SvgPicture.asset(
              'assets/icon/ic_back.svg',
            ),
          ),
          toolbarHeight: 40,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 48,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '스튜디오',
                      style: BppTextStyle.smallText
                          .copyWith(color: const Color(0xff4d4d4d)),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      '아날로그핏',
                      style: BppTextStyle.tabText,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 48,
                child: Row(
                  children: [
                    RatingBarIndicator(
                      rating: 4.6,
                      itemBuilder: (context, _) => SvgPicture.asset(
                        'assets/icon/star.svg',
                        color: const Color(0xffffc142),
                      ),
                      itemCount: 5,
                      itemSize: 25.0,
                      direction: Axis.horizontal,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      '4.6',
                      style: BppTextStyle.filterText,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Text(
                '바프 촬용이 처음인데 잘 해주셔서 너무 좋았습니다!\n다음번에 또 재촬영 하고 싶어요',
                style: BppTextStyle.smallText,
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    height: 32,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xfff2f2f2),
                        elevation: 0,
                      ),
                      child: Text(
                        '수정',
                        style: BppTextStyle.tabText.copyWith(
                          color: const Color(0xff595959),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    width: 80,
                    height: 32,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xfff2f2f2),
                        elevation: 0,
                      ),
                      child: Text(
                        '삭제',
                        style: BppTextStyle.tabText.copyWith(
                          color: const Color(0xff595959),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
