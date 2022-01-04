import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final dateStateProvider = StateProvider.autoDispose<String>(
  (ref) => DateFormat('yyyy-MM-dd').format(
    DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day + 1,
    ),
  ),
);

final dateProvider =
    Provider.autoDispose<String>((ref) => ref.watch(dateStateProvider));
