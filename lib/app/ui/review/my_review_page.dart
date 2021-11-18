import 'package:bpp_riverpod/app/provider/mypage/expiration_provider.dart';
import 'package:bpp_riverpod/app/provider/mypage/review_detail_provider.dart';
import 'package:bpp_riverpod/app/repository/mypage_repository.dart';
import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/util/format.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:bpp_riverpod/app/util/widget/custom_load_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'dart:developer' as dp;

class MyReviewPage extends ConsumerWidget {
  const MyReviewPage({
    Key? key,
    required this.id,
    required this.shopType,
    required this.shopName,
  }) : super(key: key);

  final int id;
  final String shopName;
  final String shopType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final review = ref.watch(reviewDetailProvider(id));

    return SafeArea(
      child: review.when(
          loading: () => Scaffold(
                body: customLoadingIndicator(),
              ),
          error: (error, stack) {
            dp.log(stack.toString());
            return Scaffold(
              body: Center(
                child: Text(
                  error.toString(),
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            );
          },
          data: (reviewDetail) {
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: const Text(
                    '내 리뷰 보기',
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
                  padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 56,
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
                              rating: reviewDetail.score.toDouble(),
                              itemBuilder: (context, _) => SvgPicture.asset(
                                'assets/icon/star.svg',
                                color: const Color(0xffffc142),
                              ),
                              itemCount: 5,
                              unratedColor: const Color(0xffe6e6e6),
                              itemSize: 25.0,
                              direction: Axis.horizontal,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              '${reviewDetail.score}',
                              style: BppTextStyle.filterText,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 18),
                      Text(
                        reviewDetail.contents ?? '',
                        style: BppTextStyle.smallText,
                      ),
                      const SizedBox(height: 24),
                      _editRow(
                        changeDateFormat(reviewDetail.createdAt),
                        ReviewArgs(
                          id: reviewDetail.id,
                          shopType: shopType,
                          shopName: shopName,
                          score: reviewDetail.score,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget _editRow(String date, ReviewArgs args) {
    bool _canEdit = -1 * calRemainigDay(date) < 15;
    return Consumer(builder: (context, ref, _) {
      return _canEdit
          ? Row(
              children: [
                SizedBox(
                  width: 80,
                  height: 32,
                  child: ElevatedButton(
                    onPressed: () async {
                      await ref.read(navigatorProvider).navigateTo(
                          routeName: AppRoutes.reviewEditPage, argument: args);
                      ref.read(navigatorProvider).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xfff2f2f2),
                      elevation: 0,
                    ),
                    child: Text(
                      '수정',
                      style: BppTextStyle.defaultText.copyWith(
                          color: const Color(0xff595959), fontSize: 14),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                SizedBox(
                  width: 80,
                  height: 32,
                  child: ElevatedButton(
                    onPressed: () async {
                      await ref.read(mypageRepsitory).deleteReview(args.id);
                      ref
                          .read(expirationListProvider.notifier)
                          .changeShopStateUnReviewed(id);
                      ref.read(navigatorProvider).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xfff2f2f2),
                      elevation: 0,
                    ),
                    child: Text(
                      '삭제',
                      style: BppTextStyle.defaultText.copyWith(
                          color: const Color(0xff595959), fontSize: 14),
                    ),
                  ),
                ),
              ],
            )
          : Column(
              children: [
                SizedBox(
                  width: 80,
                  height: 32,
                  child: ElevatedButton(
                    onPressed: () async {
                      await ref.read(mypageRepsitory).deleteReview(args.id);
                      ref
                          .read(expirationListProvider.notifier)
                          .changeShopStateUnReviewed(id);
                      ref.read(navigatorProvider).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xfff2f2f2),
                      elevation: 0,
                    ),
                    child: Text(
                      '삭제',
                      style: BppTextStyle.defaultText.copyWith(
                          color: const Color(0xff595959), fontSize: 14),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  '리뷰 수정 기간이 지났습니다',
                  style: BppTextStyle.smallText.copyWith(
                    color: const Color(0xffbfbfbf),
                  ),
                ),
              ],
            );
    });
  }
}
