import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  int index = 0;
  ScrollController scrollController = ScrollController();
  bool _isShow = true;

  bool get isShow => _isShow;

  set bottomVisible(bool show) {
    _isShow = show;
    update();
  }

  @override
  void onInit() {
    scrollController.addListener(isShowBottomBar);
    super.onInit();
  }

  isShowBottomBar() {
    final direction = scrollController.position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      _isShow = true;
    } else {
      _isShow = false;
    }
    update();
  }

  changeIndex(int newIndex) {
    index = newIndex;
    update();
  }
}
