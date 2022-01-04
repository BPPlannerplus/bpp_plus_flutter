import 'package:bpp_riverpod/app/util/theme/color.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabButton extends StatelessWidget {
  const TabButton({
    Key? key,
    required this.title,
    required this.index,
    required this.tap,
    required this.tabIndex,
  }) : super(key: key);

  final String title;
  final int index;
  final int tabIndex;
  final Function tap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        tap();
      },
      child: Container(
        width: 15.0 * title.length,
        height: 32,
        padding: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: tabIndex == index ? BppColor.main : BppColor.unSelButton,
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
                : BppTextStyle.defaultText.copyWith(color: BppColor.unSelText),
          ),
        ),
      ),
    );
  }
}
