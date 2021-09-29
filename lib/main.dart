import 'package:bpp_plus_flutter/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: () => GetMaterialApp(
        title: 'BPPplus',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: Routes.main,
        getPages: AppPages.routes,
        defaultTransition: Transition.fadeIn,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
