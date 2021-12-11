import 'package:bpp_riverpod/app/provider/mypage/review_provider.dart';
import 'package:bpp_riverpod/app/repository/mypage_repository.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReviewEditPage extends StatelessWidget {
  const ReviewEditPage({
    Key? key,
    required this.id,
    required this.shopType,
    required this.shopName,
    required this.score,
  }) : super(key: key);

  final int id;
  final String shopName;
  final String shopType;
  final int score;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            '리뷰 수정하기',
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
                    width: double.infinity,
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
                          shopType,
                          style: BppTextStyle.smallText
                              .copyWith(color: const Color(0xff4d4d4d)),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          shopName,
                          style: BppTextStyle.tabText,
                        ),
                        const SizedBox(width: 8)
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 110,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '만족스러우셨나요?\n경험을 공유해주세요!',
                          style: BppTextStyle.tabText,
                        ),
                        const SizedBox(height: 16),
                        RatingBarIndicator(
                          rating: score.toDouble(),
                          direction: Axis.horizontal,
                          itemCount: 5,
                          unratedColor: const Color(0xffe6e6e6),
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => SvgPicture.asset(
                            'assets/icon/star.svg',
                            color: const Color(0xffffc142),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Consumer(builder: (context, ref, _) {
                    return SizedBox(
                      height: 128,
                      child: TextField(
                        maxLines: 6,
                        style: BppTextStyle.smallText,
                        decoration: const InputDecoration(
                          hintText: '수정 할 내용을 입력해주세요!',
                        ),
                        onChanged: (text) {
                          ref.read(reviewEditTextStateProvider.state).state =
                              text;
                        },
                      ),
                    );
                  }),
                ],
              ),
              Consumer(builder: (context, ref, _) {
                final content = ref.watch(reviewEditTextProvider);
                return SizedBox(
                  width: 328.w,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: content.isEmpty
                        ? null
                        : () async {
                            await ref
                                .read(mypageRepsitory)
                                .updateReview(id, content);
                            ref.read(navigatorProvider).pop();
                          },
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
                        '수정하기',
                        style: BppTextStyle.tabText.copyWith(
                            color: content.isEmpty
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
