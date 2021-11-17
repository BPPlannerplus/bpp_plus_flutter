import 'package:bpp_riverpod/app/model/review/review_detail.dart';
import 'package:bpp_riverpod/app/repository/mypage_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final reviewDetailProvider =
    FutureProvider.family.autoDispose<ReviewDetail, int>((ref, id) {
  return ref.watch(mypageRepsitory).getReview(id);
});
