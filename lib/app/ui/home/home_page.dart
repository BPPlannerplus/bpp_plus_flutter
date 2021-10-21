import 'package:bpp_riverpod/app/provider/navigation_provider.dart';
import 'package:bpp_riverpod/app/ui/home/widget/hair_grid.dart';
import 'package:bpp_riverpod/app/ui/home/widget/home_app_bar.dart';
import 'package:bpp_riverpod/app/ui/home/widget/home_box_adapter.dart';
import 'package:bpp_riverpod/app/ui/home/widget/studio_grid.dart';
import 'package:bpp_riverpod/app/ui/home/widget/tanning_grid.dart';
import 'package:bpp_riverpod/app/ui/home/widget/waxing_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final scrollController = ScrollController();
  final _pages = const [
    StudioGrid(),
    HairGrid(),
    WaxingGrid(),
    TanningGrid(),
  ];

  @override
  void initState() {
    scrollController.addListener(() {
      final direction = scrollController.position.userScrollDirection;
      if (direction == ScrollDirection.forward) {
        ref.read(isShowBottomBar).state = true;
      } else {
        ref.read(isShowBottomBar).state = false;
      }
    });
    super.initState();
  }

  void scrollToTop() {
    scrollController.animateTo(
      200,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(homeTabProvider, (_) {
      scrollToTop();
    });
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16),
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          const HomeBoxAdpater(),
          const HomeAppBar(),
          _pages[ref.watch(homeTabProvider).state],
        ],
      ),
    );
  }
}
