import 'package:bpp_riverpod/app/provider/navigation_provider.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WithdrawalPage extends StatelessWidget {
  const WithdrawalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          elevation: 0,
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
                    width: 156.w,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  SvgPicture.asset(
                    'assets/image/withdrawal_text2.svg',
                    width: 311.w,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  SvgPicture.asset(
                    'assets/image/withdrawal_text3.svg',
                    width: 311.w,
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
                        Consumer(builder: (context, ref, _) {
                          final isWithdrawal = ref.watch(withdrawalProvier);
                          return InkWell(
                            onTap: () {
                              ref.read(withdrawalProvier.state).state =
                                  !ref.read(withdrawalProvier.state).state;
                            },
                            borderRadius: BorderRadius.circular(16),
                            child: SvgPicture.asset(
                              !isWithdrawal
                                  ? 'assets/icon/ic_check_none.svg'
                                  : 'assets/icon/ic_check_on.svg',
                            ),
                          );
                        }),
                        const Text(
                          '안내사항을 확인하였으며, 동의합니다.',
                          style: BppTextStyle.smallText,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Consumer(builder: (context, ref, _) {
                      final isWithdrawal = ref.watch(withdrawalProvier);
                      return SizedBox(
                        width: 328.w,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: isWithdrawal
                              ? () async {
                                  // final kakaoLogin =
                                  //     ref.read(flutterKakaoLoginProvider);
                                  // try {
                                  //   await ref.read(authRepositoryProvider).withdraw();
                                  //   await kakaoLogin.unlink();
                                  //   Hive.box('auth').delete('token');
                                  //   Hive.box('auth').delete('userInfo');
                                  //   ref.read(navigationProvier.state).state = 0;
                                  // } catch (e) {
                                  //   showDialog(
                                  //     context: context,
                                  //     builder: (context) {
                                  //       return const AlertDialog(
                                  //         title: Text('회원 탈퇴 실패'),
                                  //         content:
                                  //             Text('회원탈퇴에 실패했습니다\n\n다시 시도해주세요'),
                                  //       );
                                  //     },
                                  //   );
                                  // }
                                  // ref.read(navigatorProvider).navigateToRemove(
                                  //       routeName: AppRoutes.onboardingPage,
                                  //     );
                                }
                              : null,
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith((states) {
                              if (states.contains(MaterialState.disabled)) {
                                return const Color(0xffe5e5e5);
                              } else {
                                return const Color(0xff000000);
                              }
                            }),
                            elevation: MaterialStateProperty.all(0),
                          ),
                          child: Center(
                            child: Text(
                              '탈퇴하기',
                              style: BppTextStyle.tabText.copyWith(
                                  color: const Color(0xffffffff), fontSize: 16),
                            ),
                          ),
                        ),
                      );
                    }),
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
