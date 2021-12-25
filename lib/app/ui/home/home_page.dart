import 'package:bpp_riverpod/app/provider/navigation/bottom_bar_provider.dart';
import 'package:bpp_riverpod/app/provider/navigation_provider.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_page_controller_provider.dart';
import 'package:bpp_riverpod/app/ui/home/widget/beauty_grid.dart';
import 'package:bpp_riverpod/app/ui/home/widget/home_app_bar.dart';
import 'package:bpp_riverpod/app/ui/home/widget/home_box_adapter.dart';
import 'package:bpp_riverpod/app/ui/home/widget/studio_grid.dart';
import 'package:bpp_riverpod/app/ui/home/widget/tanning_grid.dart';
import 'package:bpp_riverpod/app/ui/home/widget/waxing_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final scrollController = ScrollController();
  final FToast fToast = FToast();

  @override
  void initState() {
    scrollController.addListener(() {
      final direction = scrollController.position.userScrollDirection;
      if (direction == ScrollDirection.forward) {
        ref.read(isShowBottomBarStateProvider.state).state = true;
      } else {
        ref.read(isShowBottomBarStateProvider.state).state = false;
      }
    });
    fToast.init(context);
    super.initState();
  }

  Future<void> scrollToTop() async {
    await scrollController.animateTo(0,
        duration: const Duration(milliseconds: 300), curve: Curves.linear);
    ref.watch(isShowBottomBarStateProvider.state).state = true;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(homeTabProvider, (pre, next) => scrollToTop());

    final studioPagingController = ref.watch(studioPageControllerProvider);
    final beautyPagingController = ref.watch(beautyPageControllerProvider);
    final waxingPagingController = ref.watch(waxingPageControllerProvider);
    final tanningPagingController = ref.watch(tanningPageControllerProvider);

    final _pages = [
      StudioGrid(
        fToast: fToast,
        pagingController: studioPagingController,
      ),
      BeautyGrid(
        fToast: fToast,
        pagingController: beautyPagingController,
      ),
      WaxingGrid(
        fToast: fToast,
        pagingController: waxingPagingController,
      ),
      TanningGrid(
        fToast: fToast,
        pagingController: tanningPagingController,
      ),
    ];

    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16),
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          const HomeBoxAdpater(),
          const HomeAppBar(),
          _pages[ref.watch(homeTabProvider)],
        ],
      ),
    );
  }
}
