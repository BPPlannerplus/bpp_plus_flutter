import 'package:bpp_riverpod/app/provider/navigation_provider.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          child: Column(
            children: [
              Container(
                color: Colors.white,
                height: 56,
                child: Center(
                  child: Text(
                    '찜 목록',
                    style: BppTextStyle.tabText.copyWith(fontSize: 20),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                height: 31,
                child: Stack(
                  children: [
                    Container(
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
                    Row(
                      children: [
                        likeTabButton('스튜디오', 0),
                        const SizedBox(
                          width: 16,
                        ),
                        likeTabButton('헤어스튜디오', 1),
                        const SizedBox(
                          width: 16,
                        ),
                        likeTabButton('태닝', 2),
                        const SizedBox(
                          width: 16,
                        ),
                        likeTabButton('왁싱', 3),
                        const SizedBox(
                          width: 16,
                        ),
                        likeTabButton('컨셉', 4),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget likeTabButton(String title, int index) {
    return Consumer(builder: (context, ref, _) {
      return InkWell(
        onTap: () {
          ref.read(wishTabProvider.state).state = index;
        },
        child: Container(
          width: 15.0 * title.length,
          height: 32,
          padding: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: ref.watch(wishTabProvider) == index
                    ? const Color(0xff3b75ff)
                    : const Color(0xfff2f2f2),
                width: 2.0,
              ),
            ),
          ),
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              title,
              style: ref.watch(wishTabProvider) == index
                  ? BppTextStyle.tabText
                  : BppTextStyle.defaultText,
            ),
          ),
        ),
      );
    });
  }
}
