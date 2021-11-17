import 'package:flutter/material.dart';

Widget customLoadingIndicator() {
  return const Center(
    child: SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(
        color: Color(0xff3B75FF),
        strokeWidth: 2.0,
      ),
    ),
  );
}
