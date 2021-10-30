import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_kakao_login/flutter_kakao_login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late VideoPlayerController _videoPlayerController;
  final FlutterKakaoLogin kakaoSignIn = FlutterKakaoLogin();

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.asset('assets/video/login.mp4')
          ..initialize().then((_) {
            _videoPlayerController.play();
            _videoPlayerController.setLooping(true);
            _videoPlayerController.setVolume(0.0);
            setState(() {});
          });
  }

  void load() async {
    // Kakao SDK Init (Set NATIVE_APP_KEY)
    await kakaoSignIn.init('e47501547ce66e42f222fba1d3f7da22');

    // For Android
    final hashKey = await kakaoSignIn.hashKey;
    // ignore: avoid_print
    print('hashKey: $hashKey');
  }

  Future<void> _login() async {
    try {
      final result = await kakaoSignIn.logIn();
    } on PlatformException catch (e) {}
  }

  Future<void> _logOut() async {
    try {
      final result = await kakaoSignIn.logOut();
    } on PlatformException catch (e) {}
  }

  Future<void> _unlink() async {
    try {
      final result = await kakaoSignIn.unlink();
    } on PlatformException catch (e) {}
  }

  Future<void> _getAccountInfo() async {
    try {
      final result = await kakaoSignIn.getUserMe();
      final account = result.account;
    } on PlatformException catch (e) {}
  }

  Future<void> _getAccessToken() async {
    final token = await kakaoSignIn.currentToken;
    final accessToken = token?.accessToken;
    if (accessToken != null) {
    } else {}
  }

  Future<void> _getRefreshToken() async {
    final token = await kakaoSignIn.currentToken;
    final refreshToken = token?.refreshToken;
    if (refreshToken != null) {
    } else {}
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.fill,
                child: SizedBox(
                  width: _videoPlayerController.value.size.width,
                  height: _videoPlayerController.value.size.height,
                  child: VideoPlayer(_videoPlayerController),
                ),
              ),
            ),
            Positioned(
              top: 133.h,
              left: 32.w,
              child: SvgPicture.asset(
                'assets/image/login_text.svg',
                width: 188,
                height: 66,
              ),
            ),
            Positioned(
              bottom: 56,
              left: 32.w,
              child: InkWell(
                onTap: () {
                  locator<NavigationService>().navigateToRemove(
                    routeName: AppRoutes.mainPage,
                  );
                },
                child: Image.asset(
                  'assets/image/kakao_login.png',
                  width: 296.w,
                  height: 44.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
