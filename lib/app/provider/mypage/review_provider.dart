import 'package:flutter_riverpod/flutter_riverpod.dart';

final reviewEditTextProvider =
    Provider<String>((ref) => ref.watch(reviewEditTextStateProvider));

final reviewEditTextStateProvider = StateProvider<String>((ref) => '');

final reviewScoreStateProvider = StateProvider.autoDispose<int>((ref) => 0);

final reviewTextStateProvider = StateProvider.autoDispose<String>((ref) => '');

final reviewScoreProvider = Provider.autoDispose<int>((ref) {
  final reviewScroeState = ref.watch(reviewScoreStateProvider);
  return reviewScroeState;
});

final reviewTextProvider = Provider.autoDispose<String>((ref) {
  final reviewTextState = ref.watch(reviewTextStateProvider);
  return reviewTextState;
});
