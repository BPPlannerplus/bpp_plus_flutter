import 'package:bpp_riverpod/app/provider/navigation_provider.dart';
import 'package:bpp_riverpod/app/ui/wish/widget/concept_wish_grid.dart';
import 'package:bpp_riverpod/app/ui/wish/widget/hair_wish_grid.dart';
import 'package:bpp_riverpod/app/ui/wish/widget/studio_wish_grid.dart';
import 'package:bpp_riverpod/app/ui/wish/widget/tanning_wish_grid.dart';
import 'package:bpp_riverpod/app/ui/wish/widget/waxing_wish_grid.dart';
import 'package:bpp_riverpod/app/ui/wish/widget/wish_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WishPage extends ConsumerStatefulWidget {
  const WishPage({Key? key}) : super(key: key);

  @override
  ConsumerState<WishPage> createState() => _WishPageState();
}

class _WishPageState extends ConsumerState<WishPage> {
  final scrollController = ScrollController();

  final List<Widget> _pages = const [
    StudioWishGrid(),
    HairWishGrid(),
    WaxingWishGrid(),
    TanningWishGrid(),
    ConceptWishGrid(),
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
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(wishTabProvider, (_) {
      scrollToTop();
    });
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16),
        child: Column(
          children: [
            const WishAppBar(),
            Expanded(
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  _pages[ref.watch(wishTabProvider).state],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
