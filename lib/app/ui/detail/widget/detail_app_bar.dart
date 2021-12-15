import 'package:bpp_riverpod/app/provider/detail/detail_navigation_provider.dart';
import 'package:bpp_riverpod/app/util/theme/color.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailAppBar extends StatelessWidget {
  const DetailAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: 80,
      toolbarHeight: 80,
      collapsedHeight: 80,
      pinned: true,
      titleSpacing: 0.0,
      primary: false,
      title: Padding(
        padding: const EdgeInsets.only(top: 32, right: 16, left: 16),
        child: Stack(
          children: [
            Container(
              height: 32,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: BppColor.unSelButton,
                    width: 1.0,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                tabButton('포트폴리오', 0),
                const SizedBox(width: 16),
                tabButton('상세정보', 1),
                const SizedBox(width: 16),
                tabButton('리뷰', 2),
              ],
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
            ref.read(detailTabProvider.state).state = index;
          },
          child: Container(
              width: 15.0 * title.length,
              height: 32,
              padding: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: tabIndex == index
                        ? BppColor.main
                        : BppColor.unSelButton,
                    width: tabIndex == index ? 2.0 : 1.0,
                  ),
                ),
              ),
              child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(title,
                      style: ref.watch(detailTabProvider) == index
                          ? BppTextStyle.tabText
                          : BppTextStyle.defaultText
                              .copyWith(color: BppColor.unSelText)))));
    });
  }
}
