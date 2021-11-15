import 'package:flutter_riverpod/flutter_riverpod.dart';

final dateStateProvider = StateProvider<String>((ref) => '');

final dateProvider = Provider<String>((ref) => ref.watch(dateStateProvider));
