import 'package:bpp_riverpod/app/provider/concept/concept_filter_provider.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget toggleIcon(String text, bool isCheck) {
  return Padding(
      padding: const EdgeInsets.only(right: 4.0),
      child: Container(
          height: 28,
          width: 12.0 * text.length + 25,
          decoration: BoxDecoration(
            color: isCheck ? const Color(0xff3B75FF) : const Color(0xfff2f2f2),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
              child: Text(text,
                  style: BppTextStyle.filterText.copyWith(
                      color: isCheck
                          ? const Color(0xffffffff)
                          : const Color(
                              0xff595959,
                            ),
                      fontWeight: isCheck ? FontWeight.w600 : null)))));
}

Widget filterColumn(String title, int num) {
  return Consumer(builder: (context, ref, _) {
    final filters = ref.watch(conceptFilterCheckProvider);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: SizedBox(
        height: num != 2 ? 58 : 95,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: BppTextStyle.smallText,
            ),
            const SizedBox(height: 8),
            num != 2
                ? Row(
                    children: [
                      for (var i = 0; i < filters[num].length; i++)
                        InkWell(
                          onTap: () {
                            ref
                                .read(conceptFilterCheckProvider.notifier)
                                .toggleFilterState(num, i);
                          },
                          child: toggleIcon(
                            filters[num][i].id,
                            filters[num][i].check,
                          ),
                        )
                    ],
                  )
                : Column(
                    children: [
                      Row(
                        children: [
                          for (var i = 0; i < 3; i++)
                            InkWell(
                              onTap: () {
                                ref
                                    .read(conceptFilterCheckProvider.notifier)
                                    .toggleFilterState(num, i);
                              },
                              child: toggleIcon(
                                filters[num][i].id,
                                filters[num][i].check,
                              ),
                            )
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          for (var i = 3; i < 5; i++)
                            InkWell(
                              onTap: () {
                                ref
                                    .read(conceptFilterCheckProvider.notifier)
                                    .toggleFilterState(num, i);
                              },
                              child: toggleIcon(
                                filters[num][i].id,
                                filters[num][i].check,
                              ),
                            )
                        ],
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  });
}
