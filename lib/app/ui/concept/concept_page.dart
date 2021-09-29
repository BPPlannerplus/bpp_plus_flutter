import 'package:bpp_plus_flutter/app/controller/bottom_scroll_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ConceptPage extends StatelessWidget {
  ConceptPage({Key? key}) : super(key: key);

  final bottomScrollController = Get.find<BottomScrollController>();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: bottomScrollController.scrollController,
      slivers: [
        SliverAppBar(
          elevation: 0,
          pinned: true,
          backgroundColor: Colors.white,
          expandedHeight: 161.h,
          toolbarHeight: 161.h,
          title: const SizedBox(
            child: Text(
              'Concept Page',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisExtent: 144.w,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          delegate: SliverChildBuilderDelegate(
            (_, index) => Container(
                alignment: Alignment.center,
                color: Colors.cyan[100 * (index % 9)],
                child: Text(
                  'Item ${index + 1}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                )),
            childCount: 100,
          ),
        ),
      ],
    );
  }
}
