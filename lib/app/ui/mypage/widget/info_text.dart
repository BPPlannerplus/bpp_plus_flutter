import 'package:bpp_riverpod/app/provider/navigation_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget infoText() {
  return Consumer(
    builder: (context, ref, _) {
      final visible = ref.watch(inquiryInfoTextShowProvier);
      return visible
          ? Stack(
              alignment: Alignment.centerLeft,
              children: [
                SvgPicture.asset(
                  'assets/image/inquiry_text_background.svg',
                  width: 328.w,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: SvgPicture.asset(
                    'assets/image/inquiry_text.svg',
                    width: 311.w,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: InkWell(
                    onTap: () {
                      ref.read(inquiryInfoTextShowProvier.state).state = false;
                    },
                    child: const Icon(
                      CupertinoIcons.xmark,
                      size: 20,
                    ),
                  ),
                ),
              ],
            )
          : const SizedBox();
    },
  );
}
