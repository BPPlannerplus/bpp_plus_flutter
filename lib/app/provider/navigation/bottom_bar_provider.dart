import 'package:flutter_riverpod/flutter_riverpod.dart';

final isShowBottomBarProvider =
    Provider<bool>((ref) => ref.watch(isShowBottomBarStateProvider));

final isShowBottomBarStateProvider = StateProvider<bool>((ref) => true);
