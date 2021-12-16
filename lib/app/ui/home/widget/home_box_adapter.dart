import 'package:bpp_riverpod/app/util/theme/color.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/material.dart';

class HomeBoxAdpater extends StatelessWidget {
  const HomeBoxAdpater({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(top: 64),
        height: 151,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '스튜디오 찾으세요?',
              style: BppTextStyle.smallText.copyWith(
                color: BppColor.unSelText,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '한 눈에 확인하고\n비교해보세요!',
              style: BppTextStyle.bigScreenText.copyWith(
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
