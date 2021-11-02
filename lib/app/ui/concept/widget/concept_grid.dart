import 'package:bpp_riverpod/app/model/concept.dart';
import 'package:bpp_riverpod/app/provider/concept/concpet_page_controller_provider.dart';
import 'package:bpp_riverpod/app/ui/concept/widget/concept_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ConceptGrid extends ConsumerStatefulWidget {
  const ConceptGrid({Key? key}) : super(key: key);

  @override
  ConsumerState<ConceptGrid> createState() => _ConceptGridState();
}

class _ConceptGridState extends ConsumerState<ConceptGrid> {
  @override
  Widget build(BuildContext context) {
    return PagedSliverGrid(
      pagingController: ref.watch(conceptPageControllerProvider),
      showNewPageProgressIndicatorAsGridChild: false,
      showNewPageErrorIndicatorAsGridChild: false,
      showNoMoreItemsIndicatorAsGridChild: false,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisExtent: 144,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 100 / 150,
      ),
      builderDelegate: PagedChildBuilderDelegate<Concept>(
        itemBuilder: (context, concept, index) {
          return conceptCard(
            concept: concept,
          );
        },
      ),
    );
  }
}
