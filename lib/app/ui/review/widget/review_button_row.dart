import 'package:bpp_riverpod/app/model/mypage/mypage_data.dart';
import 'package:bpp_riverpod/app/ui/review/widget/my_review_button.dart';
import 'package:bpp_riverpod/app/util/format.dart';
import 'package:bpp_riverpod/app/util/theme/color.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/material.dart';

class ReviewButtonRow extends StatelessWidget {
  const ReviewButtonRow({
    Key? key,
    required this.mypageData,
    required this.score,
    required this.date,
    required this.updateReview,
    required this.deleteReveiw,
  }) : super(key: key);

  final String date;
  final int score;
  final MypageData mypageData;
  final Function updateReview;
  final Function deleteReveiw;

  @override
  Widget build(BuildContext context) {
    final bool _canEdit = -1 * calRemainigDay(date) < 15;
    return _canEdit
        ? Row(
            children: [
              MyReviewButton(
                title: '수정',
                onTapButton: () {
                  updateReview();
                },
              ),
              const SizedBox(width: 12),
              MyReviewButton(
                title: '삭제',
                onTapButton: () {
                  deleteReveiw();
                },
              ),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyReviewButton(
                title: '삭제',
                onTapButton: () {
                  deleteReveiw();
                },
              ),
              const SizedBox(height: 12),
              Text(
                '리뷰 수정 기간이 지났습니다',
                style: BppTextStyle.smallText
                    .copyWith(color: BppColor.unSelButtonText),
              ),
            ],
          );
  }
}
