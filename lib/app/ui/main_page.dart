import 'package:bpp_riverpod/app/provider/navigation/bottom_bar_provider.dart';
import 'package:bpp_riverpod/app/provider/navigation_provider.dart';
import 'package:bpp_riverpod/app/ui/concept/concept_page.dart';
import 'package:bpp_riverpod/app/ui/home/home_page.dart';
import 'package:bpp_riverpod/app/ui/mypage/my_page.dart';
import 'package:bpp_riverpod/app/ui/wish/wish_page.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends ConsumerWidget {
  const MainPage({Key? key}) : super(key: key);

  final List<Widget> _pages = const [
    HomePage(),
    ConceptPage(),
    WishPage(),
    MyPage(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(bottomIndexProvider);
    final visible = ref.watch(isShowBottomBarProvider);

    return Scaffold(
      body: _pages[index],
      bottomNavigationBar: AnimatedContainer(
        padding: const EdgeInsets.all(3),
        duration: const Duration(milliseconds: 300),
        height: visible ? 56 : 0,
        decoration: const BoxDecoration(
          color: Color(0xffffffff),
          border: Border(top: BorderSide(color: Color(0xffe6e6e6), width: 1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            bottomIcon(
              index: 0,
              title: '메인홈',
              selectImg: 'assets/icon/ic_home_tab.svg',
              unselectImg: 'assets/icon/ic_home_none.svg',
            ),
            bottomIcon(
              index: 1,
              title: '컨셉보기',
              selectImg: 'assets/icon/ic_concept_tab.svg',
              unselectImg: 'assets/icon/ic_concept_none.svg',
            ),
            bottomIcon(
              index: 2,
              title: '찜페이지',
              selectImg: 'assets/icon/ic_like_tab.svg',
              unselectImg: 'assets/icon/ic_like_none.svg',
            ),
            bottomIcon(
              index: 3,
              title: '마이페이지',
              selectImg: 'assets/icon/ic_mypage_tab.svg',
              unselectImg: 'assets/icon/ic_mypage_none.svg',
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomIcon({
    required int index,
    required String title,
    required String selectImg,
    required String unselectImg,
  }) {
    return Consumer(builder: (context, ref, _) {
      final tabIndex = ref.watch(bottomIndexStateProvider.state).state;
      return Expanded(
        flex: 1,
        child: InkWell(
          onTap: () {
            ref.read(bottomIndexStateProvider.state).state = index;
          },
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    tabIndex == index ? selectImg : unselectImg,
                    width: 35,
                    height: 35,
                  ),
                  Text(
                    title,
                    style: BppTextStyle.filterText.copyWith(
                      color: tabIndex == index
                          ? const Color(0xff3B75FF)
                          : const Color(0xff000000),
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
