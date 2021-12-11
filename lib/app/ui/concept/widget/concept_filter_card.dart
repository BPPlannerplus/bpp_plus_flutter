import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/material.dart';

List<Widget> filterCards(List<String> filters) {
  if (filters.isEmpty) {
    return [];
  }
  return [for (var i = 0; i < filters.length; i++) filterCard(filters[i])];
}

Widget filterCard(String title) {
  if (title.isEmpty) {
    return Container();
  }
  return Padding(
    padding: const EdgeInsets.only(right: 8),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 28,
          width: 12.0 * title.length + 25,
          decoration: BoxDecoration(
            color: const Color(0xff3B75FF),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        Positioned(
            child: Container(
                height: 26,
                width: 12.0 * title.length + 23,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color(0xffffffff),
                ),
                child: Center(
                    child: Text(title,
                        style: BppTextStyle.filterText.copyWith(
                            color: const Color(0xff3B75FF),
                            fontWeight: FontWeight.w600)))))
      ],
    ),
  );
}
