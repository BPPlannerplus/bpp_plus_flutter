import 'package:bpp_riverpod/app/provider/review/shop_review_provider.dart';
import 'package:bpp_riverpod/app/ui/components/state/custom_load_indicator.dart';
import 'package:bpp_riverpod/app/ui/components/state/error_card.dart';
import 'package:bpp_riverpod/app/ui/detail/widget/review_card.dart';
import 'package:bpp_riverpod/app/util/format.dart';
import 'package:bpp_riverpod/app/util/theme/color.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                      return ReviewCard(
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
                      return ReviewCard(
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
            score.toStringAsFixed(1),
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
