import 'package:bpp_riverpod/app/provider/navigation_provider.dart';
import 'package:bpp_riverpod/app/ui/concept/concept_page.dart';
import 'package:bpp_riverpod/app/ui/home/home_page.dart';
import 'package:bpp_riverpod/app/ui/mypage/my_page.dart';
import 'package:bpp_riverpod/app/ui/wish/wish_page.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    final index = ref.watch(navigationProvier);
    final visible = ref.watch(isShowBottomBar);

    return Scaffold(
      body: _pages[index.state],
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: visible.state ? 56 : 0,
        color: const Color(0xffffffff),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            bottomIcon(
              index: 0,
              icon: CupertinoIcons.music_house_fill,
              title: '메인홈',
              selectImg: 'assets/icon/ic_home_tab.svg',
              unselectImg: 'assets/icon/ic_home_none.svg',
            ),
            bottomIcon(
              index: 1,
              icon: CupertinoIcons.book,
              title: '컨셉보기',
              selectImg: 'assets/icon/ic_concept_tab.svg',
              unselectImg: 'assets/icon/ic_concept_none.svg',
            ),
            bottomIcon(
              index: 2,
              icon: CupertinoIcons.heart,
              title: '찜페이지',
              selectImg: 'assets/icon/ic_like_tab.svg',
              unselectImg: 'assets/icon/ic_like_none.svg',
            ),
            bottomIcon(
              index: 3,
              icon: CupertinoIcons.person,
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
    required IconData icon,
    required String title,
    required String selectImg,
    required String unselectImg,
  }) {
    return Consumer(
      builder: (context, ref, _) => Expanded(
        flex: 1,
        child: InkWell(
          onTap: () {
            ref.read(navigationProvier).state = index;
          },
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ref.watch(navigationProvier).state == index
                      ? SvgPicture.asset(
                          selectImg,
                          width: 40,
                          height: 40,
                        )
                      : SvgPicture.asset(
                          unselectImg,
                          width: 40,
                          height: 40,
                        ),
                  Text(
                    title,
                    style: BppTextStyle.filterText.copyWith(
                      color: ref.read(navigationProvier).state == index
                          ? const Color(0xff3B75FF)
                          : Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
