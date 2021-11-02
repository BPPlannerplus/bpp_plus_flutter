import 'package:flutter_riverpod/flutter_riverpod.dart';

final reportCheckProvider = StateNotifierProvider.family
    .autoDispose<ReportChecks, List<bool>, int>((ref, id) => ReportChecks());

final isReportCheckProvider = Provider.family.autoDispose<bool, int>((ref, id) {
  final checks = ref.watch(reportCheckProvider(id));
  for (var i in checks) {
    if (i) {
      return true;
    }
  }
  return false;
});

class ReportChecks extends StateNotifier<List<bool>> {
  ReportChecks() : super([false, false, false, false, false]);

  void checking(int index) {
    state = [
      for (var i = 0; i < state.length; i++)
        if (i == index) true else false
    ];
  }
}
