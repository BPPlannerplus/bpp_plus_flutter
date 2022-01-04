import 'package:bpp_riverpod/app/provider/concept/concept_filter_provider.dart';
import 'package:bpp_riverpod/app/provider/concept/concept_provier.dart';
import 'package:bpp_riverpod/app/provider/navigation/bottom_bar_provider.dart';
import 'package:bpp_riverpod/app/ui/components/state/custom_load_indicator.dart';
import 'package:bpp_riverpod/app/ui/components/state/empty_item_text.dart';
import 'package:bpp_riverpod/app/ui/concept/widget/concept_app_bar.dart';
import 'package:bpp_riverpod/app/ui/concept/widget/concept_card.dart';
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
  final _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      final direction = _scrollController.position.userScrollDirection;
      if (direction == ScrollDirection.forward) {
        ref.read(isShowBottomBarStateProvider.state).state = true;
      } else {
        ref.read(isShowBottomBarStateProvider.state).state = false;
      }
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange &&
          ref.read(conceptListProvider).next != 'no Data') {
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
    _scrollController.removeListener(() {});
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final concepts = ref.watch(conceptListProvider).concepts;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  const ConceptAppBar(),
                  concepts.isEmpty
                      ? ref.watch(conceptListProvider).next!.isNotEmpty
                          ? SliverToBoxAdapter(
                              child: SizedBox(
                                height: 350,
                                child: customLoadingIndicator(),
                              ),
                            )
                          : SliverToBoxAdapter(
                              child: emptyItemText('해당 스튜디오가 존재하지 않습니다!'))
                      : SliverStaggeredGrid.countBuilder(
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          crossAxisCount: 3,
                          staggeredTileBuilder: (index) =>
                              StaggeredTile.count(1, _cnt(index)),
                          itemBuilder: (context, index) {
                            if (index < concepts.length) {
                              return ConceptCard(
                                  concept: concepts[index], index: index);
                            }

                            return ref.watch(conceptListProvider).next! ==
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

  double _cnt(int index) {
    if (index == 1) {
      return 1;
    } else if (index == 2) {
      return 0.85;
    } else {
      return 1.38;
    }
  }
}
