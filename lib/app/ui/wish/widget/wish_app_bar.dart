import 'package:bpp_riverpod/app/provider/navigation_provider.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishAppBar extends StatelessWidget {
  const WishAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 104.h,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            height: 56.h,
            child: const Center(
              child: Text(
                '찜목록',
                style: BppTextStyle.tabText,
              ),
            ),
          ),
          Container(
            color: Colors.white,
            height: 31,
            child: Row(
              children: [
                likeTabButton('스튜디오', 0),
                likeTabButton('헤어스튜디오', 1),
                likeTabButton('태닝', 2),
                likeTabButton('왁싱', 3),
                likeTabButton('컨셉', 4),
                Expanded(
                  child: Container(
                    height: 31,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xfff2f2f2),
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget likeTabButton(String title, int index) {
    return Consumer(builder: (context, ref, _) {
      return InkWell(
        onTap: () {
          ref.read(wishTabProvider).state = index;
        },
        child: Container(
          width: 15.0 * title.length + 10,
          height: 32,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: ref.watch(wishTabProvider).state == index
                    ? const Color(0xff3b75ff)
                    : const Color(0xfff2f2f2),
                width: 2.0,
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
                style: ref.watch(wishTabProvider).state == index
                    ? BppTextStyle.tabText
                    : BppTextStyle.defaultText,
              ),
            ),
          ),
        ),
      );
    });
  }
}
