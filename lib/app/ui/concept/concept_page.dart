import 'package:bpp_riverpod/app/provider/navigation_provider.dart';
import 'package:bpp_riverpod/app/ui/concept/widget/concept_app_bar.dart';
import 'package:bpp_riverpod/app/ui/concept/widget/concept_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        ref.read(isShowBottomBar).state = true;
      } else {
        ref.read(isShowBottomBar).state = false;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16),
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                controller: scrollController,
                slivers: const [
                  ConceptAppBar(),
                  ConceptGrid(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
