import 'package:bpp_riverpod/app/provider/navigation_provider.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget emptyBox({
  required String title,
  required String subTitle,
  required bool isButton,
}) {
  return SliverToBoxAdapter(
    child: Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Center(
        child: Column(
          children: [
            SvgPicture.asset('assets/image/reservation_none.svg', width: 140.w),
            const SizedBox(height: 24),
            Text(title, style: BppTextStyle.tabText),
            const SizedBox(height: 8),
            Text(subTitle,
                style: BppTextStyle.smallText
                    .copyWith(color: const Color(0xff8c8c8c))),
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
                            primary: const Color(0xff3b75ff), elevation: 0),
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
