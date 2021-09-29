import 'package:bpp_plus_flutter/app/controller/bottom_scroll_controller.dart';
import 'package:bpp_plus_flutter/app/controller/bottom_tap_controller.dart';
import 'package:bpp_plus_flutter/app/ui/concept/concept_page.dart';
import 'package:bpp_plus_flutter/app/ui/home/home_page.dart';
import 'package:bpp_plus_flutter/app/ui/mypage/my_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final bottomTapController = Get.find<BottomTapController>();
  final bottomScrollController = Get.find<BottomScrollController>();

  final List<Widget> _pages = [
    HomePage(),
    ConceptPage(),
    MyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BottomTapController>(
        init: bottomTapController,
        builder: (_) => _pages[bottomTapController.index],
      ),
      bottomNavigationBar: GetBuilder<BottomScrollController>(
          init: bottomScrollController,
          builder: (_) => AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: bottomScrollController.isShow ? 56.h : 0,
                color: Colors.blueAccent.shade100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          bottomTapController.changeIndex(0);
                        },
                        child: Icon(
                          Icons.home,
                          size: 40.h,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          bottomTapController.changeIndex(1);
                        },
                        child: Icon(
                          Icons.bookmark_outline_rounded,
                          size: 40.h,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          bottomTapController.changeIndex(2);
                        },
                        child: Icon(
                          Icons.manage_accounts_rounded,
                          size: 40.h,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
    );
  }
}
