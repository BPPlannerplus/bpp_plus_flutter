import 'package:bpp_plus_flutter/app/controller/bottom_navigation_controller.dart';
import 'package:get/get.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavigationController>(
      () => BottomNavigationController(),
    );
  }
}
