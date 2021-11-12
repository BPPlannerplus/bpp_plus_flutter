import 'package:bpp_riverpod/app/provider/navigation_provider.dart';
import 'package:bpp_riverpod/app/ui/mypage/widget/inquiry_page.dart';
import 'package:bpp_riverpod/app/ui/mypage/widget/mypage_app_bar.dart';
import 'package:bpp_riverpod/app/ui/mypage/widget/reservation_detail_page.dart';
import 'package:bpp_riverpod/app/ui/mypage/widget/reservation_schedule_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyPage extends ConsumerStatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  ConsumerState<MyPage> createState() => _MyPageState();
}

class _MyPageState extends ConsumerState<MyPage> {
  final scrollController = ScrollController();

  final List<Widget> _pages = const [
    InquiryPage(),
    ReservationSchedulePage(),
    ReservationDetailPage(),
  ];

  @override
  void initState() {
    scrollController.addListener(() {
      final direction = scrollController.position.userScrollDirection;
      if (direction == ScrollDirection.forward) {
        ref.read(isShowBottomBar.state).state = true;
      } else {
        ref.read(isShowBottomBar.state).state = false;
      }
    });
    super.initState();
  }

  void scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(myPageTabProvider, (pre, next) {
      scrollToTop();
      ref.watch(isShowBottomBar.state).state = true;
      print(
          'ref.watch(isShowBottomBar.state).state: ${ref.watch(isShowBottomBar.state).state}');
    });

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16),
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  const MypageAppBar(),
                  _pages[ref.watch(myPageTabProvider)],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
