import 'package:bpp_riverpod/app/provider/concept/concept_filter_provider.dart';
import 'package:bpp_riverpod/app/provider/concept/concept_provier.dart';
import 'package:bpp_riverpod/app/provider/navigation/bottom_bar_provider.dart';
import 'package:bpp_riverpod/app/ui/concept/widget/concept_app_bar.dart';
import 'package:bpp_riverpod/app/ui/concept/widget/concept_card.dart';
import 'package:bpp_riverpod/app/util/widget/custom_load_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ConceptPage extends ConsumerStatefulWidget {
  const ConceptPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConceptPage> createState() => _ConceptPageState();
}

class _ConceptPageState extends ConsumerState<ConceptPage> {
  final scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      final direction = scrollController.position.userScrollDirection;
      if (direction == ScrollDirection.forward) {
        ref.read(isShowBottomBarStateProvider.state).state = true;
      } else {
        ref.read(isShowBottomBarStateProvider.state).state = false;
      }
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange &&
          ref.read(conceptListReadProvider).next != 'no Data') {
        ref
            .read(conceptListProvider.notifier)
            .getData(ref.read(conceptReqFilter));
      }
    });

    if (ref.read(conceptListProvider).concepts.isEmpty) {
      ref
          .read(conceptListProvider.notifier)
          .getData(ref.read(conceptReqFilter));
    }
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(() {});
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final concepts = ref.watch(conceptListReadProvider).concepts;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16),
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  const ConceptAppBar(),
                  concepts.isEmpty
                      ? ref.watch(conceptListReadProvider).next!.isNotEmpty
                          ? SliverToBoxAdapter(
                              child: SizedBox(
                                height: 350,
                                child: customLoadingIndicator(),
                              ),
                            )
                          : const SliverToBoxAdapter(
                              child: SizedBox(),
                            )
                      : SliverStaggeredGrid.countBuilder(
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          crossAxisCount: 3,
                          staggeredTileBuilder: (index) =>
                              StaggeredTile.count(1, cnt(index)),
                          itemBuilder: (context, index) {
                            if (index < concepts.length) {
                              return conceptCard(concept: concepts[index]);
                            }

                            return ref.watch(conceptListReadProvider).next! ==
                                    'no Data'
                                ? const SizedBox()
                                : customLoadingIndicator();
                          },
                          itemCount: concepts.length + 1,
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  double cnt(int index) {
    if (index == 1) {
      return 1;
    } else if (index == 2) {
      return 0.85;
    } else {
      return 1.38;
    }
  }
}
