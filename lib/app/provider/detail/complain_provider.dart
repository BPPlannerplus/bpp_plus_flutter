import 'package:flutter_riverpod/flutter_riverpod.dart';

final complaingReasonProvider = Provider.autoDispose<String>(
    (ref) => ref.watch(complaingReasonStateProvider));

final complaingReasonStateProvider =
    StateProvider.autoDispose<String>((ref) => '');

final complaingContentsProvider = Provider.autoDispose<String>(
    (ref) => ref.watch(complaingContentsStateProvider));

final complaingContentsStateProvider =
    StateProvider.autoDispose<String>((ref) => '');
