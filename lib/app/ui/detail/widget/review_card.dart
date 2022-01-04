import 'package:bpp_riverpod/app/routes/custom_arg/report_arg.dart';
import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/util/format.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/theme/color.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    Key? key,
    required this.reviewId,
    required this.rating,
    required this.name,
    required this.date,
    required this.text,
    required this.onReport,
  }) : super(key: key);

  final int reviewId;
  final double rating;
  final String name;
  final String date;
  final String? text;
  final void Function(int reviewId) onReport;

  @override
  Widget build(BuildContext context) {
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
                      argument: ReportArg(
                        reviewId: reviewId,
                        onReport: onReport,
                      ),
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
                Text(
                  '$rating',
                  style: BppTextStyle.filterText,
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            color: BppColor.white,
            child: text != null
                ? Text(
                    text!,
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
                  color: BppColor.unSelButton,
                  width: 2.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
