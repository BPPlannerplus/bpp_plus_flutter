import 'package:bpp_plus_flutter/app/controller/bottom_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final bottomNavigationController = Get.find<BottomNavigationController>();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: bottomNavigationController.scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 170.h,
            child: const Center(
              child: Text('상단내용'),
            ),
          ),
        ),
        SliverAppBar(
          elevation: 0,
          pinned: true,
          floating: true,
          snap: true,
          backgroundColor: Colors.white,
          expandedHeight: 135.h,
          title: const SizedBox(
            child: Text(
              'HomePage',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 300,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          delegate: SliverChildBuilderDelegate(
            (_, index) => Container(
                alignment: Alignment.center,
                color: Colors.cyan[100 * (index % 9)],
                child: Text(
                  'Home Item ${index + 1}',
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
