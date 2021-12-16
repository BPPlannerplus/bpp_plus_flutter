import 'package:bpp_riverpod/app/model/enum/shop_type.dart';
import 'package:bpp_riverpod/app/provider/navigation_provider.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_type_provider.dart';
import 'package:bpp_riverpod/app/ui/components/button/tab_button.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishAppBar extends StatelessWidget {
  const WishAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        pinned: true,
        titleSpacing: 0,
        toolbarHeight: 111,
        title: Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Container(
                height: 111,
                color: Colors.white,
                child: Column(children: [
                  Container(
                      color: Colors.white,
                      height: 56,
                      child: Center(
                          child: Text('찜 목록',
                              style: BppTextStyle.tabText
                                  .copyWith(fontSize: 20.sp)))),
                  Container(
                      color: Colors.white,
                      height: 31,
                      child: Stack(children: [
                        Container(
                            height: 31,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Color(0xfff2f2f2),
                                        width: 2.0)))),
                        Consumer(builder: (context, ref, _) {
                          final tabIndex = ref.watch(wishTabProvider);
                          return SizedBox(
                            height: 32,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                if (index == 4) {
                                  return TabButton(
                                    title: '컨셉',
                                    index: index,
                                    tap: () {
                                      ref.read(wishTabProvider.state).state =
                                          index;
                                    },
                                    tabIndex: tabIndex,
                                  );
                                } else {
                                  return TabButton(
                                    title: shopTypeToString(index),
                                    index: index,
                                    tap: () {
                                      ref.read(wishTabProvider.state).state =
                                          index;
                                      ref
                                          .read(shopWishTypeProvider.state)
                                          .state = ShopType.values[index];
                                    },
                                    tabIndex: tabIndex,
                                  );
                                }
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 16),
                              itemCount: 5,
                            ),
                          );
                        }),
                      ]))
                ]))));
  }
}
