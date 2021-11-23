import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavigationProvider = StateProvider<int>((ref) => 0);

final onboardingPageProvider = StateProvider<int>((ref) => 0);

final homeTabProvider = StateProvider<int>((ref) => 0);

final wishTabProvider = StateProvider<int>((ref) => 0);

final myPageTabProvider = StateProvider<int>((ref) => 0);

final inquiryTabProvider = StateProvider<int>((ref) => 0);

final inquiryInfoProvier = StateProvider<bool>((ref) => true);

final inquiryInfoTextShowProvier = StateProvider<bool>((ref) => true);

final withdrawalProvier = StateProvider<bool>((ref) => false);
