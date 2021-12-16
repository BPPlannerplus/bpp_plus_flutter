import 'package:bpp_riverpod/app/provider/login_provider.dart';
import 'package:bpp_riverpod/app/provider/navigation_provider.dart';
import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/ui/components/app_bar/custom_app_bar.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar('설정'),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer(builder: (context, ref, _) {
                final navigator = ref.watch(navigatorProvider);
                return InkWell(
                  onTap: () {
                    navigator.navigateTo(routeName: AppRoutes.licensePage);
                  },
                  child: const Text(
                    '라이센스',
                    style: BppTextStyle.defaultText,
                  ),
                );
              }),
              SizedBox(height: 12.h),
              Container(
                height: 1,
                width: 312.w,
                color: const Color(0xffbfbfbf),
              ),
              SizedBox(height: 12.h),
              InkWell(
                onTap: () async {
                  final kakaoLogin = ref.read(flutterKakaoLoginProvider);
                  try {
                    await kakaoLogin.logOut();
                    Hive.box('auth').delete('token');
                    Hive.box('auth').delete('userInfo');
                    ref.read(bottomIndexStateProvider.state).state = 0;
                  } catch (e) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          title: Text('로그 아웃 실패'),
                          content: Text('로그 아웃에 실패했습니다\n\n다시 시도해주세요'),
                        );
                      },
                    );
                  }
                  ref
                      .read(navigatorProvider)
                      .navigateToRemove(routeName: AppRoutes.loginPage);
                },
                child: const Text(
                  '로그아웃',
                  style: BppTextStyle.defaultText,
                ),
              ),
              SizedBox(height: 12.h),
              Container(
                height: 1,
                width: 312.w,
                color: const Color(0xffbfbfbf),
              ),
              SizedBox(height: 12.h),
              Consumer(builder: (context, ref, _) {
                final navigator = ref.watch(navigatorProvider);
                return InkWell(
                  onTap: () {
                    navigator.navigateTo(
                      routeName: AppRoutes.withdrawalPage,
                    );
                  },
                  child: const Text(
                    '회원탈퇴',
                    style: BppTextStyle.defaultText,
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
