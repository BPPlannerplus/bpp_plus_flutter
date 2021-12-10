import 'package:bpp_riverpod/app/provider/navigation_provider.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget noItemCard() {
  return Center(
    child: Column(
      children: [
        const SizedBox(height: 100),
        SvgPicture.asset('assets/image/image_no_favorite.svg'),
        const SizedBox(height: 24),
        const Text(
          '찜한 스튜디오가 없어요!',
          style: BppTextStyle.tabText,
        ),
        const SizedBox(height: 8),
        Text(
          '마음에 드는 스튜디오를 저장해보세요!',
          style: BppTextStyle.smallText.copyWith(
            color: const Color(0xff8c8c8c),
          ),
        ),
        const SizedBox(height: 16),
        Consumer(
          builder: (context, ref, _) => SizedBox(
            width: 155,
            height: 33,
            child: ElevatedButton(
              onPressed: () {
                ref.read(bottomIndexStateProvider.state).state = 0;
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xff3b75ff),
                elevation: 0,
              ),
              child: Text(
                '스튜디오 보러가기',
                style: BppTextStyle.defaultText.copyWith(
                  color: const Color(0xffffffff),
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
