import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/util/provider_log.dart';
import 'package:bpp_riverpod/app/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    ProviderScope(
      child: const MyApp(),
      observers: [
        Logger(),
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: () => MaterialApp(
        title: 'BPP',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.loginPage,
        onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings),
        theme: theme,
      ),
    );
  }
}
