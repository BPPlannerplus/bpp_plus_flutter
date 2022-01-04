import 'package:flutter_riverpod/flutter_riverpod.dart';

final reservationCheckProvider =
    Provider<bool>((ref) => ref.watch(reservationCheckStateProvider));

final reservationCheckStateProvider = StateProvider<bool>((ref) => false);
