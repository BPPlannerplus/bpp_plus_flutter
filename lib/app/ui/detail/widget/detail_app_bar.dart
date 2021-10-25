import 'package:bpp_riverpod/app/provider/navigation_provider.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailAppBar extends StatelessWidget {
  const DetailAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: 56,
      toolbarHeight: 56,
      collapsedHeight: 56,
      pinned: true,
      titleSpacing: 0.0,
      backgroundColor: Colors.white,
      title: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16),
        child: Row(
          children: [
            tabButton('포트폴리오', 0),
            tabButton('상세정보', 1),
            tabButton('리뷰', 2),
            Expanded(
              child: Container(
                height: 32,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xfff2f2f2),
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tabButton(String title, int index) {
    return Consumer(builder: (context, ref, _) {
      final tabIndex = ref.watch(detailTabProvider);
      return InkWell(
        onTap: () {
          ref.read(detailTabProvider).state = index;
        },
        child: Container(
          width: 15.0 * title.length + 10,
          height: 32,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: tabIndex.state == index
                    ? const Color(0xff3b75ff)
                    : const Color(0xfff2f2f2),
                width: tabIndex.state == index ? 2.0 : 1.0,
              ),
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                right: 5,
                left: 5,
                bottom: 5,
              ),
              child: Text(
                title,
                style: ref.watch(detailTabProvider).state == index
                    ? BppTextStyle.tabText.copyWith()
                    : BppTextStyle.defaultText,
              ),
            ),
          ),
        ),
      );
    });
  }
}
