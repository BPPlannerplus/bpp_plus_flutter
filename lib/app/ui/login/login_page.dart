import 'package:bpp_riverpod/app/model/auth/token_data.dart';
import 'package:bpp_riverpod/app/model/auth/user_info.dart';
import 'package:bpp_riverpod/app/provider/auth/login_provider.dart';
import 'package:bpp_riverpod/app/provider/auth/user_provider.dart';
import 'package:bpp_riverpod/app/repository/auth_repository.dart';
import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  Future<void> _login() async {
    final kakaoLogin = ref.watch(flutterKakaoLogin);
    final authRepository = ref.watch(authRepositoryProvider);

    try {
      final result = await kakaoLogin.logIn();
      final token = result.token!.accessToken!;

      // 카카오 토큰으로 유저 정보 요청
      final userData =
          await authRepository.kakaoLogin(LoginRequest(accessToken: token));

      //  유저 정보로 자체 토큰 요청
      final tokenData = await authRepository
          .getNewToken(UserInfoRequest(userInfo: userData.userInfo));

      // 유저 정보 업데이트
      ref.watch(userInfoProvider.state).state = userData.userInfo;
      ref.watch(tokenDataProvider.state).state = tokenData;

      Hive.box('auth').put('token', tokenData.refreshToken);
      Hive.box('auth').put('userInfo', userData.userInfo);
    } on PlatformException catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Login실패'),
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final navigator = ref.watch(navigatorProvider);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:
              const EdgeInsets.only(top: 133, left: 40, right: 40, bottom: 56),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'assets/image/login_img.svg',
                width: 225.w,
              ),
              InkWell(
                onTap: () async {
                  await _login();
                  navigator.navigateToRemove(routeName: AppRoutes.mainPage);
                },
                child: Image.asset(
                  'assets/image/kakao_login_large_wide .png',
                  width: 296.w,
                  height: 44.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
