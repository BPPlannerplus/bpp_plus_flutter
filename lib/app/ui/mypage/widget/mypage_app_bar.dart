import 'package:bpp_riverpod/app/provider/mypage/inquiry_provider.dart';
import 'package:bpp_riverpod/app/provider/navigation_provider.dart';
import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/util/enum.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MypageAppBar extends ConsumerWidget {
  const MypageAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = ref.watch(myPageTabProvider);
    final isInquiryEmpty = ref.watch(isInquiryEmptyProvider);
    final navigator = ref.watch(navigatorProvider);

    return SliverToBoxAdapter(
      child: Container(
        height: tabIndex == 0 && !isInquiryEmpty ? 252 : 200,
        padding: const EdgeInsets.only(top: 72),
        color: const Color(0xffffffff),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: const Color(0xffffffff),
                  height: 56,
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Text(
                      '서현님\n환영합니다!',
                      style: BppTextStyle.screenText.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    navigator.navigateTo(
                      routeName: AppRoutes.settingPage,
                    );
                  },
                  child: SvgPicture.asset(
                    'assets/icon/ic_setting.svg',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              color: const Color(0xffffffff),
              height: 31,
              child: Stack(
                children: [
                  Container(
                    height: 31,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xfff2f2f2),
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      inquiryTabButton('문의내역', 0),
                      const SizedBox(width: 16),
                      inquiryTabButton('예약일정', 1),
                      const SizedBox(width: 16),
                      inquiryTabButton('예약내역', 2),
                    ],
                  ),
                ],
              ),
            ),
            tabIndex == 0 && !isInquiryEmpty
                ? Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        studioCard('스튜디오', 0),
                        studioCard('헤어메이크업', 1),
                        studioCard('왁싱', 2),
                        studioCard('태닝', 3),
                      ],
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget studioCard(String title, int index) {
    return Consumer(builder: (context, ref, _) {
      final idx = ref.watch(inquiryTabProvider);
      return Padding(
        padding: const EdgeInsets.only(right: 8),
        child: InkWell(
          onTap: () {
            ref.read(inquiryTabProvider.state).state = index;
            ref.read(inquiryShopTypeProvider.state).state =
                ShopType.values[index];
          },
          child: Container(
            height: 28,
            width: 13.0 * title.length + 20,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
              color: idx == index
                  ? const Color(0xff3b75ff)
                  : const Color(0xfff2f2f2),
            ),
            child: Center(
              child: Text(
                title,
                style: BppTextStyle.filterText.copyWith(
                  color: idx == index
                      ? const Color(0xffffffff)
                      : const Color(0xff525252),
                  fontWeight: idx == index ? FontWeight.w600 : null,
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget inquiryTabButton(String title, int index) {
    return Consumer(builder: (context, ref, _) {
      return InkWell(
        onTap: () {
          ref.read(myPageTabProvider.state).state = index;
        },
        child: Container(
          width: 15.0 * title.length,
          height: 32,
          padding: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: ref.watch(myPageTabProvider) == index
                    ? const Color(0xff3b75ff)
                    : const Color(0xfff2f2f2),
                width: 2.0,
              ),
            ),
          ),
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              title,
              style: ref.watch(myPageTabProvider) == index
                  ? BppTextStyle.tabText
                  : BppTextStyle.defaultText
                      .copyWith(color: const Color(0xff595959)),
            ),
          ),
        ),
      );
    });
  }
}
