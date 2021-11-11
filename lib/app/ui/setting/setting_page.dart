import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          elevation: 0,
          centerTitle: true,
          leading: Consumer(builder: (context, ref, _) {
            final navigator = ref.watch(navigatorProvider);
            return InkWell(
              onTap: () {
                navigator.pop();
              },
              child: SvgPicture.asset(
                'assets/icon/ic_back.svg',
              ),
            );
          }),
          title: Text(
            '설정',
            style: BppTextStyle.tabText,
          ),
        ),
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
                  child: Text(
                    '라이센스',
                    style: BppTextStyle.defaultText,
                  ),
                );
              }),
              SizedBox(
                height: 12.h,
              ),
              Container(
                height: 1,
                width: 312.w,
                color: const Color(0xffbfbfbf),
              ),
              SizedBox(
                height: 12.h,
              ),
              InkWell(
                onTap: () async {
                  // Future<void> _logOut() async {
                  //   try {
                  //     final result = await kakaoSignIn.logOut();
                  //   } on PlatformException catch (e) {}
                  // }
                },
                child: Text(
                  '로그아웃',
                  style: BppTextStyle.defaultText,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Container(
                height: 1,
                width: 312.w,
                color: const Color(0xffbfbfbf),
              ),
              SizedBox(
                height: 12.h,
              ),
              Consumer(builder: (context, ref, _) {
                final navigator = ref.watch(navigatorProvider);
                return InkWell(
                  onTap: () {
                    navigator.navigateTo(
                      routeName: AppRoutes.withdrawalPage,
                    );
                  },
                  child: Text(
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
