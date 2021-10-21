import 'package:bpp_riverpod/app/provider/navigation_provider.dart';
import 'package:bpp_riverpod/app/ui/concept/concept_page.dart';
import 'package:bpp_riverpod/app/ui/home/home_page.dart';
import 'package:bpp_riverpod/app/ui/mypage/my_page.dart';
import 'package:bpp_riverpod/app/ui/wish/wish_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            bottomIcon(
              index: 0,
              icon: CupertinoIcons.home,
              title: '메인홈',
            ),
            bottomIcon(
              index: 1,
              icon: CupertinoIcons.book,
              title: '컨셉보기',
            ),
            bottomIcon(
              index: 2,
              icon: CupertinoIcons.heart,
              title: '찜페이지',
            ),
            bottomIcon(
              index: 3,
              icon: CupertinoIcons.person,
              title: '마이페이지',
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
  }) {
    return Consumer(
      builder: (context, ref, _) => Expanded(
        flex: 1,
        child: InkWell(
          onTap: () {
            ref.read(navigationProvier).state = index;
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 30,
                color: ref.read(navigationProvier).state == index
                    ? const Color(0xff3B75FF)
                    : Colors.black,
              ),
              Text(
                title,
                style: TextStyle(
                  color: ref.read(navigationProvier).state == index
                      ? const Color(0xff3B75FF)
                      : Colors.black,
                  fontSize: 13.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
