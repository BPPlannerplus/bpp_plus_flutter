import 'package:bpp_riverpod/app/model/enum/shop_type.dart';
import 'package:bpp_riverpod/app/model/mypage/mypage_data.dart';
import 'package:bpp_riverpod/app/provider/mypage/expiration_provider.dart';
import 'package:bpp_riverpod/app/provider/mypage/review_detail_provider.dart';
import 'package:bpp_riverpod/app/provider/review/my_review_provider.dart';
import 'package:bpp_riverpod/app/repository/mypage_repository.dart';
import 'package:bpp_riverpod/app/routes/custom_arg/review_arg.dart';
import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/ui/components/app_bar/custom_app_bar.dart';
import 'package:bpp_riverpod/app/ui/components/state/custom_load_indicator.dart';
import 'package:bpp_riverpod/app/ui/components/state/error_card.dart';
import 'package:bpp_riverpod/app/ui/review/widget/review_button_row.dart';
import 'package:bpp_riverpod/app/util/format.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/theme/color.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyReviewPage extends ConsumerWidget {
  const MyReviewPage({Key? key, required this.mypageData}) : super(key: key);

  final MypageData mypageData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final review = ref.watch(reviewDetailProvider(mypageData.id));

    return SafeArea(
      child: review.when(
          loading: () => Scaffold(body: customLoadingIndicator()),
          error: (error, stack) => Scaffold(body: errorCard()),
          data: (data) {
            final reviewDetail = ref.watch(myReviewStateProvider(data));

            return SafeArea(
              child: Scaffold(
                appBar: customAppBar('내 리뷰 보기'),
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
                            Text(shopTypeToString(mypageData.shop.type),
                                style: BppTextStyle.smallText
                                    .copyWith(color: const Color(0xff4d4d4d))),
                            SizedBox(height: 5.h),
                            Text(mypageData.shop.name,
                                style: BppTextStyle.tabText)
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
                                color: BppColor.rating,
                              ),
                              itemCount: 5,
                              unratedColor: BppColor.textFormBorder,
                              itemSize: 25.0,
                              direction: Axis.horizontal,
                            ),
                            const SizedBox(width: 12),
                            Text('${reviewDetail.score.toDouble()}',
                                style: BppTextStyle.filterText)
                          ],
                        ),
                      ),
                      const SizedBox(height: 18),
                      Text(reviewDetail.contents ?? '',
                          style: BppTextStyle.smallText),
                      const SizedBox(height: 24),
                      ReviewButtonRow(
                        date: changeDateFormat(reviewDetail.createdAt),
                        mypageData: mypageData,
                        score: reviewDetail.score,
                        isEdit: reviewDetail.editable,
                        updateReview: () async {
                          final review =
                              await ref.read(navigatorProvider).navigateTo(
                                    routeName: AppRoutes.reviewEditPage,
                                    argument: ReviewEditArg(
                                      mypageData: mypageData,
                                      score: reviewDetail.score,
                                      reviewId: reviewDetail.id,
                                    ),
                                  );
                          ref
                              .read(myReviewStateProvider(data).notifier)
                              .updateReview(review);
                        },
                        deleteReveiw: () async {
                          await ref
                              .read(mypageRepsitory)
                              .deleteReview(reviewDetail.id);
                          ref
                              .read(expirationListProvider.notifier)
                              .changeShopStateUnReviewed(mypageData.id);
                          ref.read(navigatorProvider).pop();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
