import 'package:bpp_riverpod/app/model/review/complain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final complaingReasonProvider =
    StateProvider.autoDispose<String>((ref) => 'ads');

final complaingContentsProvider =
    StateProvider.autoDispose<String>((ref) => '');

final complainProvider = Provider.autoDispose<Complain>((ref) {
  final reason = ref.watch(complaingReasonProvider);
  final contents = ref.watch(complaingContentsProvider);

  return Complain(
    reason: reason,
    contents: contents,
  );
});
