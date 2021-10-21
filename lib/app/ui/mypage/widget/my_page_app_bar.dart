import 'package:bpp_riverpod/app/provider/navigation_provider.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyPageAppBar extends StatelessWidget {
  const MyPageAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 252,
      padding: const EdgeInsets.only(top: 72),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.white,
                height: 56,
                child: const Center(
                  child: Text(
                    '서현님\n환영합니다!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Icon(
                Icons.settings,
                color: Colors.black,
                size: 20,
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            color: Colors.white,
            height: 31,
            child: Row(
              children: [
                likeTabButton('문의내역', 0),
                likeTabButton('예약일정', 1),
                likeTabButton('예약내역', 2),
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
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                studioCard('스튜디오', 0),
                studioCard('헤어메이크업', 1),
                studioCard('왁싱', 2),
                studioCard('태닝', 3),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget studioCard(String title, int index) {
    return Consumer(builder: (context, ref, _) {
      final idx = ref.watch(inquiryTabProvider);
      return Padding(
        padding: const EdgeInsets.only(right: 8),
        child: InkWell(
          onTap: () {
            ref.read(inquiryTabProvider).state = index;
          },
          child: Container(
            height: 28,
            width: 13.0 * title.length + 20,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
              color: idx.state == index
                  ? const Color(0xff3b75ff)
                  : const Color(0xfff2f2f2),
            ),
            child: Center(
              child: Text(
                title,
                style: BppTextStyle.filterText.copyWith(
                  color: idx.state == index
                      ? Colors.white
                      : const Color(0xff525252),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget likeTabButton(String title, int index) {
    return Consumer(builder: (context, ref, _) {
      return InkWell(
        onTap: () {
          ref.read(myPageTabProvider).state = index;
        },
        child: Container(
          width: 15.0 * title.length,
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
                bottom: 5,
              ),
              child: Text(
                title,
                style: BppTextStyle.tabText,
              ),
            ),
          ),
        ),
      );
    });
  }
}
