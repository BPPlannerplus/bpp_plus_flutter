import 'package:bpp_riverpod/app/model/mypage/mypage_data.dart';

class ReviewEditArg {
  final MypageData mypageData;
  final int score;
  final int reviewId;

  ReviewEditArg({
    required this.mypageData,
    required this.score,
    required this.reviewId,
  });
}
