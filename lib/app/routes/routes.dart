import 'package:bpp_plus_flutter/app/binding/main_binding.dart';
import 'package:bpp_plus_flutter/app/ui/main/main_page.dart';
import 'package:get/get.dart';

abstract class Routes {
  static const main = '/';
}

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.main,
      page: () => MainPage(),
      binding: MainBindings(),
    ),
  ];
}
