import 'package:bpp_riverpod/app/util/theme/color.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({
    Key? key,
    required this.check,
    required this.onPressedButton,
    required this.buttonTitle,
    this.activeButtonColor,
  }) : super(key: key);

  final bool check;
  final Function onPressedButton;
  final String buttonTitle;

  final Color? activeButtonColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 328.w,
      height: 48,
      child: ElevatedButton(
        onPressed: check
            ? null
            : () {
                onPressedButton();
              },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.disabled)) {
                return BppColor.unSelButton;
              }
              return activeButtonColor ?? BppColor.main;
            },
          ),
          elevation: MaterialStateProperty.all(0),
        ),
        child: Center(
          child: Text(
            buttonTitle,
            style: BppTextStyle.tabText.copyWith(
              color: check ? BppColor.unSelButtonText : BppColor.white,
            ),
          ),
        ),
      ),
    );
  }
}
