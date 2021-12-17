import 'package:bpp_riverpod/app/provider/review/shop_review_provider.dart';
import 'package:bpp_riverpod/app/routes/custom_arg/report_arg.dart';
import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/ui/components/state/custom_load_indicator.dart';
import 'package:bpp_riverpod/app/ui/components/state/error_card.dart';
import 'package:bpp_riverpod/app/util/format.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/theme/color.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailReviewPage extends ConsumerWidget {
  const DetailReviewPage({Key? key, required this.shopId}) : super(key: key);

  final int shopId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviewResponse = ref.watch(reviewResponseProvider(shopId));
    return reviewResponse.when(
        error: (error, stacktrace) => SliverToBoxAdapter(child: errorCard()),
        loading: () => SliverToBoxAdapter(child: customLoadingIndicator()),
        data: (data) {
          final reviewState = ref.watch(shopReviewProvider(data));
          if (reviewState.count == 0) {
            return SliverToBoxAdapter(
                child: Column(children: [topReviewCard(0), emptyReview()]));
          } else {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (reviewState.count == 1) {
                    if (index == 0) {
                      return topReviewCard(
                          reviewState.reviews[index].score.toDouble());
                    } else {
                      return _reviewCard(
                        reviewId: reviewState.reviews[index - 1].id,
                        rating: reviewState.reviews[index - 1].score.toDouble(),
                        name: reviewState.reviews[index - 1].userName,
                        date: reviewState.reviews[index - 1].date,
                        text: reviewState.reviews[index - 1].contents,
                        // onReport: ref
                        //     .read(shopReviewStateProvider(data).notifier)
                        //     .reportReview,
                        onReport: (id) {},
                      );
                    }
                  } else {
                    List<int> scores =
                        reviewState.reviews.map((e) => e.score).toList();
                    double reviewScore = calReviewScore(scores);

                    if (index == 0) {
                      return topReviewCard(reviewScore);
                    } else {
                      return _reviewCard(
                        reviewId: reviewState.reviews[index - 1].id,
                        rating: reviewState.reviews[index - 1].score.toDouble(),
                        name: reviewState.reviews[index - 1].userName,
                        date: reviewState.reviews[index - 1].date,
                        text: reviewState.reviews[index - 1].contents,
                        // onReport: ref
                        //     .read(shopReviewStateProvider(data).notifier)
                        //     .reportReview,
                        onReport: (id) {},
                      );
                    }
                  }
                },
                childCount: reviewState.count + 1,
              ),
            );
          }
        });
  }

  Widget topReviewCard(double score) {
    return Container(
      height: 72,
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$score',
            style: BppTextStyle.bigScreenText.copyWith(fontSize: 30.sp),
          ),
          SizedBox(width: 10.w),
          RatingBarIndicator(
            rating: score.toDouble(),
            itemBuilder: (context, index) =>
                const Icon(Icons.star, color: BppColor.rating),
            unratedColor: BppColor.textFormBorder,
            itemCount: 5,
            itemSize: 25.0,
            direction: Axis.horizontal,
          ),
        ],
      ),
    );
  }

  Widget emptyReview() {
    return SizedBox(
      height: 150,
      child: Center(
        child: Text(
          '아직 작성된 리뷰가 없습니다.',
          style: BppTextStyle.tabText.copyWith(
            color: BppColor.unSelButtonText,
          ),
        ),
      ),
    );
  }
}

Widget _reviewCard({
  required int reviewId,
  required double rating,
  required String name,
  required String date,
  String? text,
  required void Function(int reviewId) onReport,
}) {
  return Container(
    padding: const EdgeInsets.only(top: 16),
    color: BppColor.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(changeReviewNameFormat(name),
                    style: BppTextStyle.filterText),
                const SizedBox(width: 8),
                Text(
                  changeReviewDateFormat(date),
                  style: BppTextStyle.filterText
                      .copyWith(color: BppColor.unSelButtonText),
                ),
              ],
            ),
            Consumer(builder: (context, ref, _) {
              final navigator = ref.watch(navigatorProvider);
              return InkWell(
                onTap: () {
                  navigator.navigateTo(
                    routeName: AppRoutes.reportPage,
                    argument: ReportArg(reviewId: reviewId, onReport: onReport),
                  );
                },
                child: Text(
                  '신고',
                  style: BppTextStyle.filterText
                      .copyWith(color: BppColor.unSelButtonText),
                ),
              );
            }),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 20,
          color: Colors.white,
          child: Row(
            children: [
              RatingBarIndicator(
                rating: rating,
                itemBuilder: (context, _) => SvgPicture.asset(
                    'assets/icon/star.svg',
                    color: BppColor.rating),
                unratedColor: BppColor.unSelButtonText,
                itemCount: 5,
                itemSize: 25.0,
                direction: Axis.horizontal,
              ),
              SizedBox(width: 5.w),
              Text('$rating', style: BppTextStyle.filterText)
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          color: BppColor.white,
          child: text != null
              ? Text(text, style: BppTextStyle.filterText)
              : const SizedBox(),
        ),
        text != null ? const SizedBox(height: 16) : const SizedBox(),
        Container(
            height: 1,
            decoration: const BoxDecoration(
                border: Border(
                    bottom:
                        BorderSide(color: BppColor.unSelButton, width: 2.0))))
      ],
    ),
  );
}
