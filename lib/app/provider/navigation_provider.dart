import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigationProvier = StateProvider<int>((ref) {
  print('>>>바텀 네비게이션 프로바이더<<<');
  return 0;
});

final isShowBottomBar = StateProvider<bool>((ref) {
  print('>>>바텀바 네비게이션 프로바이더<<<');
  return true;
});

final homeTabProvider = StateProvider<int>((ref) => 0);

final wishTabProvider = StateProvider<int>((ref) => 0);

final myPageTabProvider = StateProvider<int>((ref) => 0);

final inquiryTabProvider = StateProvider<int>((ref) => 0);

final inquiryInfoProvier = StateProvider<bool>((ref) => true);

final inquiryInfoTextShowProvier = StateProvider<bool>((ref) => true);

final withdrawalProvier = StateProvider<bool>((ref) => false);
