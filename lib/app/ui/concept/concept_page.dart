import 'package:bpp_plus_flutter/app/controller/concept_controller.dart';
import 'package:bpp_plus_flutter/app/controller/concept_filter_controller.dart';
import 'package:bpp_plus_flutter/app/ui/concept/widget/concept_appbar.dart';
import 'package:bpp_plus_flutter/app/ui/concept/widget/concept_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConceptPage extends StatelessWidget {
  ConceptPage({Key? key}) : super(key: key);

  final conceptController = Get.put<ConceptController>(
    ConceptController(),
  );
  final conceptFilterController = Get.put<ConceptFilterController>(
    ConceptFilterController(),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConceptAppBar(),
        const Expanded(
          child: ConceptGridView(),
        ),
      ],
    );
  }
}
