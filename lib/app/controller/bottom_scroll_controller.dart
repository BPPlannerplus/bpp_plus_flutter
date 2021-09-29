import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class BottomScrollController extends GetxController {
  ScrollController scrollController = ScrollController();
  bool isShow = true;

  @override
  void onInit() {
    scrollController.addListener(isShowBottomBar);
    super.onInit();
  }

  isShowBottomBar() {
    final direction = scrollController.position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      isShow = true;
    } else {
      isShow = false;
    }
    update();
  }
}
