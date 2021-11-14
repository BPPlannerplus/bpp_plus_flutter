import 'package:bpp_riverpod/app/provider/auth/login_provider.dart';
import 'package:bpp_riverpod/app/provider/auth/shared_provider.dart';
import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/provider_log.dart';
import 'package:bpp_riverpod/app/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xffe0e0e0),
    ),
  );

  runApp(
    ProviderScope(
      child: const MyApp(),
      observers: [
        Logger(),
      ],
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
      initRoute = await checkToken();
    });
  }

  void initKakao() async {
    final kakaoLogin = ref.watch(flutterKakaoLogin);
    await kakaoLogin.init('728c87e40ccd496fb94f1000585da2df');
  }

  Future<String> checkToken() async {
    final prefs = await ref.watch(sharedProvider.future);
    final token = prefs.getString('token') ?? 'no token';
    if (token == 'no token') {
      print('토큰 없음');
      return AppRoutes.loginPage;
    }
    print('토큰 있음 token: $token');
    return AppRoutes.mainPage;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: () => MaterialApp(
        title: 'BPP',
        debugShowCheckedModeBanner: false,
        initialRoute: initRoute,
        onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings),
        navigatorKey: ref.watch(navigatorProvider).navigatorKey,
        theme: theme,
        scrollBehavior: MyBehavior(),
      ),
    );
  }
}
