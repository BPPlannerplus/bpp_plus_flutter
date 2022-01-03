import 'package:bpp_riverpod/app/model/enum/shop_type.dart';
import 'package:bpp_riverpod/app/provider/mypage/inquiry_provider.dart';
import 'package:bpp_riverpod/app/provider/navigation_provider.dart';
import 'package:bpp_riverpod/app/ui/components/button/tab_button.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MypageAppBar extends ConsumerWidget {
  const MypageAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = ref.watch(myPageTabProvider);
    final isInquiryEmpty = ref.watch(isInquiryEmptyProvider);

    return SliverAppBar(
      titleSpacing: 0,
      elevation: 0,
      pinned: true,
      backgroundColor: Colors.white,
      expandedHeight: tabIndex == 0 && !isInquiryEmpty ? 102 : 56,
      toolbarHeight: tabIndex == 0 && !isInquiryEmpty ? 102 : 56,
      collapsedHeight: tabIndex == 0 && !isInquiryEmpty ? 102 : 56,
      centerTitle: false,
      title: SizedBox(
        height: tabIndex == 0 && !isInquiryEmpty ? 102 : 56,
        child: Column(
          children: [
            const SizedBox(height: 12),
            Stack(
              children: [
                Container(
                  height: 32,
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
            tabIndex == 0 && !isInquiryEmpty
                ? Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: const [
                        _StudioCard(
                          title: '스튜디오',
                          index: 0,
                        ),
                        _StudioCard(
                          title: '헤어메이크업',
                          index: 1,
                        ),
                        _StudioCard(
                          title: '왁싱',
                          index: 2,
                        ),
                        _StudioCard(
                          title: '태닝',
                          index: 3,
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
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

class _StudioCard extends ConsumerWidget {
  const _StudioCard({
    Key? key,
    required this.title,
    required this.index,
  }) : super(key: key);

  final String title;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            borderRadius: const BorderRadius.all(Radius.circular(16)),
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
  }
}
