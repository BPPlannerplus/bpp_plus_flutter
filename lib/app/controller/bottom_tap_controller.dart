import 'package:get/get.dart';

class BottomTapController extends GetxController {
  int index = 0;

  changeIndex(int newIndex) {
    index = newIndex;
    update();
  }
}
