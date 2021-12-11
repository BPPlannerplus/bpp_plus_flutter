import 'package:bpp_riverpod/app/provider/concept/concept_filter_provider.dart';
import 'package:bpp_riverpod/app/ui/concept/widget/concept_botton_sheet.dart';
import 'package:bpp_riverpod/app/ui/concept/widget/concept_filter_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConceptAppBar extends ConsumerWidget {
  const ConceptAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visible = ref.watch(concpetFilterEmptyProvider);

    return SliverAppBar(
      pinned: true,
      titleSpacing: 0,
      toolbarHeight: visible ? 173 : 133,
      title: Container(
        padding: const EdgeInsets.only(
          top: 40,
        ),
        color: Colors.white,
        height: visible ? 150 : 110,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset('assets/image/concept_text.svg', width: 190),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      context: context,
                      isScrollControlled: true,
                      builder: (_) => conceptBottomSheet(),
                    );
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    color: Colors.white,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: const Color(0xfff2f2f2),
                      child: SvgPicture.asset(
                        'assets/icon/ic_filter.svg',
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Expanded(
              child: Container(
                height: 1,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Color(0xffe6e6e6),
                    ),
                  ),
                ),
              ),
            ),
            visible
                ? Container(
                    height: 40,
                    width: double.infinity,
                    color: Colors.white,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ...filterCards(ref.watch(conceptFilter).headNum),
                        ...filterCards(ref.watch(conceptFilter).gender),
                        ...filterCards(ref.watch(conceptFilter).background),
                        ...filterCards(ref.watch(conceptFilter).prop),
                        ...filterCards(ref.watch(conceptFilter).cloth),
                      ],
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
