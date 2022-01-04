import 'package:bpp_riverpod/app/util/theme/color.dart';
import 'package:flutter/material.dart';

Widget customLoadingIndicator() {
  return const Center(
    child: SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(
        color: BppColor.main,
        strokeWidth: 2.0,
      ),
    ),
  );
}
