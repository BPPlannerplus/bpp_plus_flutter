import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:bpp_riverpod/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WithdrawalPage extends StatelessWidget {
  const WithdrawalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 56,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              locator<NavigationService>().pop();
            },
            child: SvgPicture.asset(
              'assets/icon/ic_back.svg',
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '회원탈퇴',
                    style: BppTextStyle.bigScreenText,
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
                    height: 16.h,
                  ),
                  SvgPicture.asset(
                    'assets/image/withdrawal_text1.svg',
                    height: 12.h,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  SvgPicture.asset(
                    'assets/image/withdrawal_text2.svg',
                    height: 32.h,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  SvgPicture.asset(
                    'assets/image/withdrawal_text3.svg',
                    height: 32.h,
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icon/ic_check_none.svg',
                        ),
                        const Text(
                          '안내사항을 확인하였으며, 동의합니다.',
                          style: BppTextStyle.smallText,
                        )
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xff000000),
                      ),
                      child: Text(
                        '탈퇴하기',
                        style: BppTextStyle.tabText.copyWith(
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
