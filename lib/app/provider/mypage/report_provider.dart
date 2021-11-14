import 'package:flutter_riverpod/flutter_riverpod.dart';

final reportCheckProvider =
    StateNotifierProvider.autoDispose<ReportChecks, List<bool>>(
        (ref) => ReportChecks());

final isReportCheckProvider = Provider.autoDispose<bool>((ref) {
  final checks = ref.watch(reportCheckProvider);
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
