import 'package:flutter_riverpod/flutter_riverpod.dart';

final reviewScoreProvider = StateProvider.autoDispose<double>((ref) => 0);

final reviewTextProvider = StateProvider.autoDispose<String>((ref) => '');
