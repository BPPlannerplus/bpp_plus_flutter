import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final detailTabProvider = StateProvider.autoDispose<int>((ref) => 0);

final detailPageProvider = StateProvider.autoDispose<int>((ref) => 0);

final detailPageLeadingProvier = StateProvider<bool>((ref) => true);

final detailPageControllerProvider =
    Provider.autoDispose<PageController>((ref) => PageController(
          initialPage: 0,
        ));
