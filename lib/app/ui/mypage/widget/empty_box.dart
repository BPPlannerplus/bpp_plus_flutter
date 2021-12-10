import 'package:bpp_riverpod/app/provider/navigation_provider.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget emptyBox({
  required String img,
  required double topPadding,
  required bool isButton,
}) {
  return SliverToBoxAdapter(
    child: Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: Center(
        child: Column(
          children: [
            SvgPicture.asset(
              img,
              width: 221.w,
            ),
            const SizedBox(height: 16),
            isButton
                ? Consumer(
                    builder: (context, ref, _) => SizedBox(
                      width: 155,
                      height: 33,
                      child: ElevatedButton(
                        onPressed: () {
                          ref.read(bottomIndexStateProvider.state).state = 0;
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xff3b75ff),
                        ),
                        child: Text(
                          '스튜디오 보러가기',
                          style: BppTextStyle.defaultText.copyWith(
                            color: const Color(0xffffffff),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    ),
  );
}
