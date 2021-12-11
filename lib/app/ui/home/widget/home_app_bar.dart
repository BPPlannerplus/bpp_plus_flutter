import 'package:bpp_riverpod/app/provider/navigation_provider.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_type_provider.dart';
import 'package:bpp_riverpod/app/ui/home/widget/home_bottom_sheet.dart';
import 'package:bpp_riverpod/app/util/enum.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      titleSpacing: 0,
      elevation: 0,
      pinned: true,
      floating: true,
      snap: true,
      backgroundColor: Colors.white,
      expandedHeight: 112,
      toolbarHeight: 56,
      collapsedHeight: 56,
      centerTitle: false,
      title: Stack(
        children: [
          Container(
              height: 32,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: const Color(0xfff2f2f2), width: 1.0.h)))),
          Row(
            children: [
              tabButton('스튜디오', 0),
              const SizedBox(width: 16),
              tabButton('헤어메이크업', 1),
              const SizedBox(width: 16),
              tabButton('왁싱', 2),
              const SizedBox(width: 16),
              tabButton('태닝', 3),
            ],
          ),
        ],
      ),
      flexibleSpace: Container(
        margin: const EdgeInsets.only(top: 72),
        padding: const EdgeInsets.only(bottom: 16, top: 16),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Consumer(builder: (context, ref, _) {
            return InkWell(
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
              onTap: () {
                showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    context: context,
                    builder: (_) {
                      return homeBottomSheet(
                          ref.read(homeTabProvider.state).state);
                    });
              },
              child: Container(
                height: 32,
                width: 76,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  color: Color(0xfff2f2f2),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icon/ic_filter.svg',
                        width: 30,
                        height: 30,
                      ),
                      const Text(
                        '필터',
                        style: BppTextStyle.filterText,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget tabButton(String title, int index) {
    return Consumer(builder: (context, ref, _) {
      final tabIndex = ref.watch(homeTabProvider);

      return InkWell(
        onTap: () {
          ref.read(homeTabProvider.state).state = index;
          ref.read(shopTypeProvider.state).state = ShopType.values[index];
        },
        child: Container(
          width: 15.0 * title.length,
          height: 32,
          padding: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: tabIndex == index
                    ? const Color(0xff3b75ff)
                    : const Color(0xfff2f2f2),
                width: tabIndex == index ? 2.0.h : 1.0.h,
              ),
            ),
          ),
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              title,
              style: tabIndex == index
                  ? BppTextStyle.tabText
                  : BppTextStyle.defaultText.copyWith(
                      color: const Color(0xff595959),
                    ),
            ),
          ),
        ),
      );
    });
  }
}
