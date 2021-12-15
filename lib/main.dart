import 'package:bpp_riverpod/app/model/auth/user_info.dart';
import 'package:bpp_riverpod/app/provider/auth/login_provider.dart';
import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserInfoAdapter());
  await Hive.openBox('auth');
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Color(0xffe0e0e0)));

  runApp(
    const ProviderScope(
      child: MyApp(),
      // observers: [
      //   Logger(),
      // ],
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  String initRoute = AppRoutes.loginPage;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 0), () async {
      initKakao();
    });
  }

  void initKakao() async {
    final kakaoLogin = ref.watch(flutterKakaoLogin);
    await kakaoLogin.init('728c87e40ccd496fb94f1000585da2df');
  }

  String checkToken() {
    final token = Hive.box('auth').get('token') ?? 'no token';
    if (token == 'no token') {
      return AppRoutes.onboardingPage;
    }
    return AppRoutes.mainPage;
  }

  @override
  Widget build(BuildContext context) {
    final initPage = checkToken();

    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: () => MaterialApp(
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: child!,
          );
        },
        title: 'BPP',
        debugShowCheckedModeBanner: false,
        initialRoute: initPage,
        onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings),
        navigatorKey: ref.watch(navigatorProvider).navigatorKey,
        theme: theme,
        scrollBehavior: MyBehavior(),
      ),
    );
  }
}
