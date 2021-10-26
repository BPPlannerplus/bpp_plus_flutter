import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:bpp_riverpod/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 56,
          elevation: 0,
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              locator<NavigationService>().pop();
            },
            child: SvgPicture.asset(
              'assets/icon/ic_back.svg',
            ),
          ),
          title: const Text(
            '설정',
            style: BppTextStyle.tabText,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '라이센스',
                style: BppTextStyle.defaultText,
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
              const Text(
                '로그아웃',
                style: BppTextStyle.defaultText,
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
              InkWell(
                onTap: () {
                  locator<NavigationService>().navigateTo(
                    routeName: AppRoutes.withdrawalPage,
                  );
                },
                child: const Text(
                  '회원탈퇴',
                  style: BppTextStyle.defaultText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
