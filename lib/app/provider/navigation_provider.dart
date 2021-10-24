import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigationProvier = StateProvider<int>((ref) => 0);

final isShowBottomBar = StateProvider<bool>((ref) => true);

final homeTabProvider = StateProvider<int>((ref) => 0);

final wishTabProvider = StateProvider<int>((ref) => 0);

final conceptTabProvider = StateProvider<int>((ref) => 0);

final detailTabProvider = StateProvider.autoDispose<int>((ref) => 0);

final detailPageProvider = StateProvider<int>((ref) => 0);

final myPageTabProvider = StateProvider<int>((ref) => 0);

final inquiryTabProvider = StateProvider<int>((ref) => 0);

final inquiryInfoProvier = StateProvider<bool>((ref) => true);

final inquiryInfoTextShowProvier = StateProvider<bool>((ref) => true);