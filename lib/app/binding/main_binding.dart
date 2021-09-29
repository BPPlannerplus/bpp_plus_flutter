import 'package:bpp_plus_flutter/app/controller/bottom_scroll_controller.dart';
import 'package:bpp_plus_flutter/app/controller/bottom_tap_controller.dart';
import 'package:get/get.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomScrollController());
    Get.lazyPut(() => BottomTapController());
  }
}
