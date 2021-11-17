import 'package:bpp_riverpod/app/model/review/review.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final reviewScoreProvider = StateProvider.autoDispose<int>((ref) => 0);

final reviewTextProvider = StateProvider.autoDispose<String>((ref) => '');

final reviewRequestProvider = Provider.autoDispose<ReviewRequest>((ref) {
  final score = ref.watch(reviewScoreProvider);
  final contents = ref.watch(reviewTextProvider);

  return ReviewRequest(score: score, contents: contents);
});
