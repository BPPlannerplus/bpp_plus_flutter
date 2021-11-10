import 'package:bpp_riverpod/app/provider/auth/login_provider.dart';
import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late VideoPlayerController _videoPlayerController;

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

  Future<void> _login() async {
    final kakaoLogin = ref.watch(flutterKakaoLogin);

    try {
      final result = await kakaoLogin.logIn();
    } on PlatformException catch (e) {}
  }

  Future<void> _getAccountInfo() async {
    final kakaoLogin = ref.watch(flutterKakaoLogin);

    try {
      final result = await kakaoLogin.getUserMe();
      final account = result.account;

      print('account!.userID: ${account!.userID}');
      print('account.userEmail: ${account.userEmail}');
    } on PlatformException catch (e) {}
  }

  Future<void> _getAccessToken() async {
    final kakaoLogin = ref.watch(flutterKakaoLogin);

    final token = await kakaoLogin.currentToken;

    final accessToken = token?.accessToken;

    print('accessToken: $accessToken');
    if (accessToken != null) {
    } else {}
  }

  Future<void> _getRefreshToken() async {
    final kakaoLogin = ref.watch(flutterKakaoLogin);

    final token = await kakaoLogin.currentToken;

    final refreshToken = token?.refreshToken;

    print('refreshToken: $refreshToken');

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
                onTap: () async {
                  // await _login();
                  // // await _getAccountInfo();
                  // await _getAccessToken();
                  // await _getRefreshToken();
                  locator<NavigationService>().navigateToRemove(
                    routeName: AppRoutes.mainPage,
                  );
                },
                child: Image.asset(
                  'assets/image/kakao_login_large_wide .png',
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
