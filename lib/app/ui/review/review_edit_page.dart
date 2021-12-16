import 'package:bpp_riverpod/app/model/mypage/mypage_data.dart';
import 'package:bpp_riverpod/app/provider/mypage/review_provider.dart';
import 'package:bpp_riverpod/app/repository/mypage_repository.dart';
import 'package:bpp_riverpod/app/ui/components/button/confirm_button.dart';
import 'package:bpp_riverpod/app/ui/review/widget/review_app_bar.dart';
import 'package:bpp_riverpod/app/ui/review/widget/shop_info_column.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/theme/color.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReviewEditPage extends StatelessWidget {
  const ReviewEditPage({
    Key? key,
    required this.mypageData,
    required this.reviewId,
    required this.score,
  }) : super(key: key);

  final MypageData mypageData;
  final int score;
  final int reviewId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: reviewAppBar('리뷰 수정하기'),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 24, right: 16, left: 16, bottom: 24),
          child: LayoutBuilder(builder: (context, constraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShopInfoColumn(shopData: mypageData.shop),
                        SizedBox(
                          height: 32,
                          child: RatingBarIndicator(
                            rating: score.toDouble(),
                            direction: Axis.horizontal,
                            itemCount: 5,
                            unratedColor: const Color(0xffe6e6e6),
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => SvgPicture.asset(
                                'assets/icon/star.svg',
                                color: BppColor.rating),
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
                                  hintText: '수정 할 내용을 입력해주세요!'),
                              onChanged: (text) {
                                ref
                                    .read(reviewEditTextStateProvider.state)
                                    .state = text;
                              },
                            ),
                          );
                        }),
                      ],
                    ),
                    const SizedBox(height: 150),
                    Consumer(builder: (context, ref, _) {
                      final content = ref.watch(reviewEditTextProvider);
                      return ConfirmButton(
                        check: content.isEmpty,
                        buttonTitle: '수정하기',
                        onPressedButton: () async {
                          final review = await ref
                              .read(mypageRepsitory)
                              .updateReview(reviewId, content);
                          ref.read(navigatorProvider).pop(result: review);
                        },
                      );
                    }),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
