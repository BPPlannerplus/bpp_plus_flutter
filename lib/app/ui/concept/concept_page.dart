import 'package:bpp_plus_flutter/app/controller/bottom_scroll_controller.dart';
import 'package:bpp_plus_flutter/app/controller/concept_controller.dart';
import 'package:bpp_plus_flutter/app/ui/concept/widget/concept_appbar.dart';
import 'package:bpp_plus_flutter/app/ui/concept/widget/concept_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConceptPage extends StatelessWidget {
  ConceptPage({Key? key}) : super(key: key);

  final bottomScrollController = Get.find<BottomScrollController>();
  final controller = Get.put<ConceptController>(ConceptController());

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: bottomScrollController.scrollController,
      headerSliverBuilder: (context, _) => [
        ConceptAppBar(),
      ],
      body: ConceptGridView(),
    );
  }
}
