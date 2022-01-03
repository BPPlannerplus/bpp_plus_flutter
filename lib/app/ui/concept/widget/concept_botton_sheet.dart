import 'package:bpp_riverpod/app/provider/concept/concept_filter_provider.dart';
import 'package:bpp_riverpod/app/provider/concept/concept_provier.dart';
import 'package:bpp_riverpod/app/provider/navigation/bottom_bar_provider.dart';
import 'package:bpp_riverpod/app/ui/concept/widget/concept_bts_icon.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/theme/color.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConceptBottomSheet extends ConsumerWidget {
  const ConceptBottomSheet({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigator = ref.watch(navigatorProvider);

    return Container(
      padding: const EdgeInsets.all(16),
      height: 545,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8), topRight: Radius.circular(8))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('컨셉필터', style: BppTextStyle.defaultText),
              InkWell(
                onTap: () {
                  ref
                      .read(conceptFilterCheckProvider.notifier)
                      .refreshFilterState();
                },
                child: SvgPicture.asset('assets/icon/ic_refresh.svg'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const FilterColumn(title: '인원', count: 0),
          const FilterColumn(title: '성별', count: 1),
          const FilterColumn(title: '배경', count: 2),
          const FilterColumn(title: '소품', count: 3),
          const FilterColumn(title: '의상', count: 4),
          ElevatedButton(
            onPressed: () {
              ref.read(conceptFilter.state).state =
                  ref.read(conceptFilterCheckProvider.notifier).makeFilter();
              final filter = ref.read(conceptReqFilter.state).state =
                  ref.read(conceptFilterCheckProvider.notifier).makeReqFilter();
              ref.read(conceptListProvider.notifier).reset(filter);
              ref.read(isShowBottomBarStateProvider.state).state = true;
              navigator.pop();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                const Color(0xff3B75FF),
              ),
              elevation: MaterialStateProperty.all(0),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            child: SizedBox(
              height: 48,
              child: Center(
                child: Text(
                  '선택완료',
                  style: BppTextStyle.tabText.copyWith(
                    color: BppColor.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
