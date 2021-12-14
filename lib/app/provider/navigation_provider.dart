import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomIndexProvider =
    Provider<int>((ref) => ref.watch(bottomIndexStateProvider));

final bottomIndexStateProvider = StateProvider<int>((ref) => 0);

final onboardingPageProvider = StateProvider<int>((ref) => 0);

final homeTabProvider = StateProvider.autoDispose<int>((ref) => 0);

final wishTabProvider = StateProvider.autoDispose<int>((ref) => 0);

final myPageTabProvider = StateProvider.autoDispose<int>((ref) => 1);

final inquiryTabProvider = StateProvider<int>((ref) => 0);

final inquiryInfoProvier = StateProvider<bool>((ref) => true);

final inquiryInfoTextShowProvier = StateProvider<bool>((ref) => true);

final withdrawalProvier = StateProvider<bool>((ref) => false);
