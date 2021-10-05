import 'package:bpp_plus_flutter/app/controller/bottom_navigation_controller.dart';
import 'package:bpp_plus_flutter/app/ui/concept/concept_page.dart';
import 'package:bpp_plus_flutter/app/ui/home/home_page.dart';
import 'package:bpp_plus_flutter/app/ui/like/like_page.dart';
import 'package:bpp_plus_flutter/app/ui/mypage/my_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final bottomNavigationController = Get.find<BottomNavigationController>();

  final List<Widget> _pages = [
    HomePage(),
    ConceptPage(),
    LikePage(),
    MyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BottomNavigationController>(
        init: bottomNavigationController,
        builder: (_) => _pages[bottomNavigationController.index],
      ),
      bottomNavigationBar: GetBuilder<BottomNavigationController>(
        init: bottomNavigationController,
        builder: (_) => AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: bottomNavigationController.isShow ? 56.h : 0,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              bottomIcon(
                index: 0,
                selectedImage: 'assets/icons/ic_home_on.png',
                unselectedImage: 'assets/icons/ic_home_off.png',
                title: '메인홈',
              ),
              bottomIcon(
                index: 1,
                selectedImage: 'assets/icons/ic_concept_on.png',
                unselectedImage: 'assets/icons/ic_concept_off.png',
                title: '컨셉보기',
              ),
              bottomIcon(
                index: 2,
                selectedImage: 'assets/icons/ic_like_bt_on.png',
                unselectedImage: 'assets/icons/ic_like_bt_off.png',
                title: '찜페이지',
              ),
              bottomIcon(
                index: 3,
                selectedImage: 'assets/icons/ic_mypage_on.png',
                unselectedImage: 'assets/icons/ic_mypage_off.png',
                title: '마이페이지',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomIcon({
    required int index,
    required String selectedImage,
    required String unselectedImage,
    required String title,
  }) {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: () {
          bottomNavigationController.changeIndex(index);
        },
        child: Column(
          children: [
            bottomNavigationController.index == index
                ? Image(
                    image: AssetImage(selectedImage),
                    width: 35.w,
                    height: 35.h,
                    fit: BoxFit.cover,
                  )
                : Image(
                    image: AssetImage(unselectedImage),
                    width: 35.w,
                    height: 35.h,
                    fit: BoxFit.cover,
                  ),
            Text(
              title,
              style: TextStyle(
                color: bottomNavigationController.index == index
                    ? const Color(0xff3B75FF)
                    : Colors.black,
                fontSize: 13.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
