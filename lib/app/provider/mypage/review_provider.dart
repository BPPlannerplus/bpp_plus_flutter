import 'package:flutter_riverpod/flutter_riverpod.dart';

final reviewScoreProvider = StateProvider.autoDispose<double>((ref) => 0);
