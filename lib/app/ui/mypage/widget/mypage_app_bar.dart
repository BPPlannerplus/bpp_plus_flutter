import 'package:bpp_riverpod/app/model/enum/shop_type.dart';
import 'package:bpp_riverpod/app/provider/mypage/inquiry_provider.dart';
import 'package:bpp_riverpod/app/provider/navigation_provider.dart';
import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/ui/components/button/tab_button.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MypageAppBar extends ConsumerWidget {
  const MypageAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = ref.watch(myPageTabProvider);
    final isInquiryEmpty = ref.watch(isInquiryEmptyProvider);
    final navigator = ref.watch(navigatorProvider);
    final userInfo = Hive.box('auth').get('userInfo');

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
                      '${userInfo.userName}님\n환영합니다!',
                      style: BppTextStyle.screenText
                          .copyWith(fontWeight: FontWeight.w600, height: 1.3),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    navigator.navigateTo(
                      routeName: AppRoutes.settingPage,
                    );
                  },
                  child: SvgPicture.asset('assets/icon/ic_setting.svg'),
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
                  SizedBox(
                    height: 32,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => TabButton(
                        title: _mypageTabName(index),
                        index: index,
                        tap: () {
                          ref.read(myPageTabProvider.state).state = index;
                        },
                        tabIndex: tabIndex,
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 16),
                      itemCount: 3,
                    ),
                  ),
                ],
              ),
            ),
            tabIndex == 0 && !isInquiryEmpty
                ? Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        _studioCard('스튜디오', 0),
                        _studioCard('헤어메이크업', 1),
                        _studioCard('왁싱', 2),
                        _studioCard('태닝', 3),
                      ],
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget _studioCard(String title, int index) {
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

  String _mypageTabName(int index) {
    switch (index) {
      case 0:
        return '문의내역';
      case 1:
        return '예약일정';
      case 2:
        return '예약내역';
      default:
        return '';
    }
  }
}
