import 'package:bpp_riverpod/app/provider/concept_provier.dart';
import 'package:bpp_riverpod/app/ui/concept/widget/concept_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConceptGrid extends ConsumerStatefulWidget {
  const ConceptGrid({Key? key}) : super(key: key);

  @override
  ConsumerState<ConceptGrid> createState() => _ConceptGridState();
}

class _ConceptGridState extends ConsumerState<ConceptGrid> {
  @override
  void initState() {
    if (ref.read(conceptListProvider).concepts.isEmpty) {
      ref.read(conceptListProvider.notifier).getData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final conceptList = ref.watch(conceptListProvider);
    final conceptListState = ref.read(conceptListProvider.notifier);

    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisExtent: 144,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          if (conceptList.next!.isNotEmpty &&
              index == conceptList.concepts.length - 10) {
            ref.read(conceptListProvider.notifier).getData();
          }
          if (index == conceptList.concepts.length) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return conceptCard(
            index: index,
            profie: conceptList.concepts[index].profile,
            like: conceptList.concepts[index].like,
            stateRead: conceptListState,
          );
        },
        childCount: conceptList.concepts.length +
            (conceptList.next!.isNotEmpty ? 1 : 0),
      ),
    );
  }
}
