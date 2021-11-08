import 'package:bpp_riverpod/app/provider/shop/shop_filter_provider.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_page_controller_provider.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_provider.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

homeBottomSheet(int index) {
  return Consumer(builder: (context, ref, _) {
    final filter = ref.watch(studioFilterProvider);
    return Container(
      padding: const EdgeInsets.only(
        top: 16,
        right: 16,
        left: 16,
        bottom: 34,
      ),
      height: 240,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '스튜디오 지역 선택',
                style: BppTextStyle.defaultText.copyWith(
                  fontSize: 16.sp,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                runSpacing: 8,
                children: [
                  for (var i = 0; i < filter.length; i++)
                    InkWell(
                      onTap: () {
                        ref
                            .read(studioFilterProvider.notifier)
                            .toggleFilterState(i);
                      },
                      child: toggleIcon(
                        filter[i].id,
                        filter[i].check,
                      ),
                    )
                ],
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(studioPageControllerProvider).refresh();
              ref.read(studioListProvider.notifier).reset();
              locator<NavigationService>().pop();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                const Color(0xff3B75FF),
              ),
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
                  style: BppTextStyle.tabText
                      .copyWith(color: const Color(0xffffffff)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  });
}

Widget toggleIcon(String text, bool isCheck) {
  return Padding(
    padding: const EdgeInsets.only(right: 8),
    child: Container(
      width: 76,
      height: 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: isCheck ? const Color(0xff3B75FF) : Colors.grey.shade100,
      ),
      child: Center(
        child: Text(
          text,
          style: BppTextStyle.smallText.copyWith(
            color: isCheck
                ? const Color(0xffffffff)
                : const Color(
                    0xff595959,
                  ),
            fontWeight: isCheck ? FontWeight.w700 : null,
            fontSize: 14.sp,
          ),
        ),
      ),
    ),
  );
}
