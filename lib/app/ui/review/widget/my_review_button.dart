import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/material.dart';

class MyReviewButton extends StatelessWidget {
  const MyReviewButton({
    Key? key,
    required this.title,
    required this.onTapButton,
  }) : super(key: key);

  final String title;
  final Function onTapButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 32,
      child: ElevatedButton(
        onPressed: () {
          onTapButton();
        },
        style: ElevatedButton.styleFrom(
          primary: const Color(0xfff2f2f2),
          elevation: 0,
        ),
        child: Text(
          title,
          style: BppTextStyle.defaultText
              .copyWith(color: const Color(0xff595959), fontSize: 14),
        ),
      ),
    );
  }
}
