import 'package:bpp_plus_flutter/app/controller/concept_controller.dart';
import 'package:bpp_plus_flutter/app/ui/concept/widget/concept_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ConceptGridView extends GetView<ConceptController> {
  const ConceptGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (_) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          controller: controller.scrollController,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisExtent: 144.w,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemCount: controller.data.concepts.length + 1,
          itemBuilder: (_, index) {
            if (index < controller.data.concepts.length) {
              var datum = controller.data.concepts[index];
              return InkWell(
                onTap: () {
                  Get.dialog(const ConceptDialog());
                },
                child: Material(
                  elevation: 10.0,
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    color: Colors.lightBlue[100 * (index % 9)],
                    child: ListTile(
                      title: Text(datum.profile),
                    ),
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
