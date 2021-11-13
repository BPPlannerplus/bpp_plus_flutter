import 'dart:math';

import 'package:bpp_riverpod/app/provider/mypage/review_provider.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReviewWritePage extends StatelessWidget {
  const ReviewWritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            '리뷰 작성하기',
            style: BppTextStyle.defaultText,
          ),
          leading: Consumer(builder: (context, ref, _) {
            final navigator = ref.watch(navigatorProvider);
            return InkWell(
              onTap: () {
                navigator.pop();
              },
              child: SvgPicture.asset(
                'assets/icon/ic_back.svg',
              ),
            );
          }),
          toolbarHeight: 40,
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 24, right: 16, left: 16, bottom: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 63,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xffe6e6e6),
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '스튜디오',
                          style: BppTextStyle.smallText
                              .copyWith(color: const Color(0xff4d4d4d)),
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          children: [
                            Text(
                              '아날로그핏',
                              style: BppTextStyle.tabText,
                            ),
                            const SizedBox(width: 8),
                            Transform.rotate(
                              angle: pi,
                              child: const Icon(
                                Icons.arrow_back_ios_new,
                                color: Color(0xff000000),
                                size: 20,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 110,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '만족스러우셨나요?\n경험을 공유해주세요!',
                          style: BppTextStyle.tabText,
                        ),
                        const SizedBox(height: 16),
                        Consumer(builder: (context, ref, _) {
                          return RatingBar.builder(
                            initialRating: ref.watch(reviewScoreProvider),
                            minRating: 0,
                            glow: false,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            unratedColor: const Color(0xffe6e6e6),
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => SvgPicture.asset(
                              'assets/icon/star.svg',
                              color: const Color(0xffffc142),
                            ),
                            onRatingUpdate: (rating) {
                              ref.read(reviewScoreProvider.state).state =
                                  rating;
                            },
                          );
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 128,
                    child: TextField(
                      maxLines: 6,
                      style: BppTextStyle.smallText,
                      decoration: const InputDecoration(
                        hintText: '좀 더 자세하게 공유해주실 수 있나요?',
                      ),
                    ),
                  ),
                ],
              ),
              Consumer(builder: (context, ref, _) {
                return SizedBox(
                  width: 328.w,
                  height: 48,
                  child: ElevatedButton(
                    onPressed:
                        ref.watch(reviewScoreProvider) == 0.0 ? null : () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                        (states) {
                          if (states.contains(MaterialState.disabled)) {
                            return const Color(0xfff2f2f2);
                          }
                          return const Color(0xff3b75ff);
                        },
                      ),
                      elevation: MaterialStateProperty.all(0),
                    ),
                    child: Center(
                      child: Text(
                        '등록하기',
                        style: BppTextStyle.tabText.copyWith(
                            color: ref.watch(reviewScoreProvider) == 0.0
                                ? const Color(0xffbfbfbf)
                                : const Color(0xffffffff),
                            fontSize: 16),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
