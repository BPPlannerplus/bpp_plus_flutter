import 'package:bpp_riverpod/app/provider/detail/detail_navigation_provider.dart';
import 'package:bpp_riverpod/app/ui/components/button/tab_button.dart';
import 'package:bpp_riverpod/app/util/theme/color.dart';
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
                            color: BppColor.unSelButton, width: 1.0)))),
            Consumer(builder: (context, ref, _) {
              final tabIndex = ref.watch(detailTabProvider);
              return SizedBox(
                height: 32,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => TabButton(
                    title: _detailTabName(index),
                    index: index,
                    tap: () {
                      ref.read(detailTabProvider.state).state = index;
                    },
                    tabIndex: tabIndex,
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 16),
                  itemCount: 3,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  String _detailTabName(int index) {
    switch (index) {
      case 0:
        return '포트폴리오';
      case 1:
        return '상세정보';
      case 2:
        return '리뷰';
      default:
        return '';
    }
  }
}
