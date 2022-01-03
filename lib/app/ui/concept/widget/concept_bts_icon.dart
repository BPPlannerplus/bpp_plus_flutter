import 'package:bpp_riverpod/app/provider/concept/concept_filter_provider.dart';
import 'package:bpp_riverpod/app/util/theme/color.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterColumn extends ConsumerWidget {
  const FilterColumn({
    Key? key,
    required this.title,
    required this.count,
  }) : super(key: key);

  final String title;
  final int count;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(conceptFilterCheckProvider);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: SizedBox(
        height: count != 2 ? 58 : 95,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: BppTextStyle.smallText,
            ),
            const SizedBox(height: 8),
            count != 2
                ? Row(
                    children: [
                      for (var i = 0; i < filters[count].length; i++)
                        InkWell(
                          onTap: () {
                            ref
                                .read(conceptFilterCheckProvider.notifier)
                                .toggleFilterState(count, i);
                          },
                          child: _ToggleIcon(
                            text: filters[count][i].id,
                            isCheck: filters[count][i].check,
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
                                    .toggleFilterState(count, i);
                              },
                              child: _ToggleIcon(
                                text: filters[count][i].id,
                                isCheck: filters[count][i].check,
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
                                    .toggleFilterState(count, i);
                              },
                              child: _ToggleIcon(
                                text: filters[count][i].id,
                                isCheck: filters[count][i].check,
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
  }
}

class _ToggleIcon extends StatelessWidget {
  const _ToggleIcon({
    Key? key,
    required this.text,
    required this.isCheck,
  }) : super(key: key);

  final String text;
  final bool isCheck;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4.0),
      child: Container(
        height: 28,
        width: 12.0 * text.length + 25,
        decoration: BoxDecoration(
          color: isCheck ? BppColor.main : BppColor.unSelButton,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            text,
            style: BppTextStyle.filterText.copyWith(
              color: isCheck ? BppColor.white : BppColor.unSelText,
              fontWeight: isCheck ? FontWeight.w600 : null,
            ),
          ),
        ),
      ),
    );
  }
}
