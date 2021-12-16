import 'package:bpp_riverpod/app/model/mypage/mypage_data.dart';
import 'package:bpp_riverpod/app/provider/mypage/expiration_provider.dart';
import 'package:bpp_riverpod/app/provider/mypage/review_provider.dart';
import 'package:bpp_riverpod/app/repository/mypage_repository.dart';
import 'package:bpp_riverpod/app/ui/components/button/confirm_button.dart';
import 'package:bpp_riverpod/app/ui/review/widget/review_app_bar.dart';
import 'package:bpp_riverpod/app/ui/review/widget/shop_info_column.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/theme/color.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReviewWritePage extends StatelessWidget {
  const ReviewWritePage({Key? key, required this.mypageData}) : super(key: key);

  final MypageData mypageData;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: reviewAppBar('리뷰 작성하기'),
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
                          child: Consumer(builder: (context, ref, _) {
                            return RatingBar.builder(
                              initialRating:
                                  ref.watch(reviewScoreProvider).toDouble(),
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
                                color: BppColor.rating,
                              ),
                              onRatingUpdate: (rating) {
                                ref.read(reviewScoreStateProvider.state).state =
                                    rating.toInt();
                              },
                            );
                          }),
                        ),
                        const SizedBox(height: 24),
                        Consumer(builder: (context, ref, _) {
                          return SizedBox(
                            height: 128,
                            child: TextField(
                              maxLines: 6,
                              style: BppTextStyle.smallText,
                              decoration: const InputDecoration(
                                hintText: '좀 더 자세하게 공유해주실 수 있나요?',
                              ),
                              onChanged: (text) {
                                ref.read(reviewTextStateProvider.state).state =
                                    text;
                              },
                            ),
                          );
                        }),
                      ],
                    ),
                    const SizedBox(height: 150),
                    Consumer(builder: (context, ref, _) {
                      final score = ref.watch(reviewScoreProvider);
                      final content = ref.watch(reviewTextProvider);

                      return ConfirmButton(
                        check: score == 0.0,
                        buttonTitle: '등록하기',
                        onPressedButton: () async {
                          await ref
                              .read(mypageRepsitory)
                              .createReview(mypageData.id, score, content);
                          ref.read(navigatorProvider).pop();
                          ref
                              .read(expirationListProvider.notifier)
                              .changeShopStateReviewed(mypageData.id);
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
