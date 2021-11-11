import 'package:bpp_riverpod/app/model/review/review.dart';
import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

// 기본 64, 2줄 112, 4줄 148
class DetailReviewPage extends ConsumerStatefulWidget {
  const DetailReviewPage({Key? key, required this.pagingController})
      : super(key: key);

  final PagingController<int, Review> pagingController;

  @override
  ConsumerState<DetailReviewPage> createState() => _DetailReviewPageState();
}

class _DetailReviewPageState extends ConsumerState<DetailReviewPage> {
  @override
  Widget build(BuildContext context) {
    return PagedSliverList(
      pagingController: widget.pagingController,
      builderDelegate: PagedChildBuilderDelegate<Review>(
          itemBuilder: (context, review, index) {
        if (index == 0) {
          return topReviewCard();
        }
        return reviewCard(
          rating: review.score.toDouble(),
          name: review.user.userName,
          date: review.date,
          text: review.contents,
        );
      }),
    );
  }

  Widget topReviewCard() {
    return Container(
      height: 72,
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '4.6',
            style: BppTextStyle.bigScreenText.copyWith(
              fontSize: 30,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          RatingBarIndicator(
            rating: 4.6,
            itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: Color(0xffffc142),
            ),
            unratedColor: const Color(0xffe6e6e6),
            itemCount: 5,
            itemSize: 25.0,
            direction: Axis.horizontal,
          ),
        ],
      ),
    );
  }

  Widget reviewCard({
    required double rating,
    required String name,
    required String date,
    String? text,
  }) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    name,
                    style: BppTextStyle.filterText,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    date,
                    style: BppTextStyle.filterText.copyWith(
                      color: const Color(
                        0xffbfbfbf,
                      ),
                    ),
                  ),
                ],
              ),
              Consumer(builder: (context, ref, _) {
                final navigator = ref.watch(navigatorProvider);
                return InkWell(
                  onTap: () {
                    navigator.navigateTo(
                      routeName: AppRoutes.reportPage,
                      argument: 0,
                    );
                  },
                  child: Text(
                    '신고',
                    style: BppTextStyle.filterText.copyWith(
                      color: const Color(
                        0xffbfbfbf,
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 20,
            color: Colors.white,
            child: Row(
              children: [
                RatingBarIndicator(
                  rating: rating,
                  itemBuilder: (context, _) => SvgPicture.asset(
                    'assets/icon/star.svg',
                    color: const Color(0xffffc142),
                  ),
                  unratedColor: const Color(0xffe6e6e6),
                  itemCount: 5,
                  itemSize: 25.0,
                  direction: Axis.horizontal,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  '$rating',
                  style: BppTextStyle.filterText,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            color: Colors.white,
            child: text != null
                ? Text(
                    text,
                    style: BppTextStyle.filterText,
                  )
                : const SizedBox(),
          ),
          text != null
              ? const SizedBox(
                  height: 16,
                )
              : const SizedBox(),
          Container(
            height: 1,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xfff2f2f2),
                  width: 2.0,
                ),
              ),
            ),
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
            color: const Color(0xffbfbfbf),
          ),
        ),
      ),
    );
  }
}
