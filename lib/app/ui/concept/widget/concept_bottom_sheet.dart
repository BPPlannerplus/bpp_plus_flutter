import 'package:bpp_plus_flutter/app/controller/concept_controller.dart';
import 'package:bpp_plus_flutter/app/controller/concept_filter_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ConceptBottomSheet extends StatelessWidget {
  ConceptBottomSheet({Key? key}) : super(key: key);

  final conceptController = Get.find<ConceptController>();
  final conceptFilterController = Get.find<ConceptFilterController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15.h, left: 20.w, right: 20.w),
      height: 520.h,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '컨셉필터',
                style: TextStyle(
                  fontSize: 20.sp,
                ),
              ),
              InkWell(
                onTap: () {
                  conceptFilterController.refreshFilterState();
                },
                child: Image(
                  image: const AssetImage('assets/icons/ic_reset.png'),
                  width: 40.h,
                  height: 40.h,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          filterColumn('인원', 0),
          filterColumn('성별', 1),
          filterColumn('배경', 2),
          filterColumn('소품', 3),
          filterColumn('의상', 4),
          GetBuilder(
            init: conceptFilterController,
            builder: (_) => SizedBox(
              width: Get.size.width,
              height: 44.h,
              child: ElevatedButton(
                onPressed: conceptFilterController.isFilterEmpty
                    ? () {
                        conceptFilterController.setFilter();
                        conceptController
                            .setFilter(conceptFilterController.filter);
                        Get.back();
                      }
                    : null,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.disabled)) {
                      return const Color(0xfff2f2f2);
                    } else {
                      return const Color(0xFF3b75ff);
                    }
                  }),
                ),
                child: const Text(
                  '선택완료',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget filterColumn(String title, int num) {
    return GetBuilder(
      init: conceptFilterController,
      builder: (_) => SizedBox(
        height: num != 2 ? 75.h : 80.h,
        width: Get.size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
              ),
            ),
            SizedBox(height: 8.h),
            num != 2
                ? Row(
                    children: [
                      for (var i = 0;
                          i < conceptFilterController.filters[num].length;
                          i++)
                        InkWell(
                          onTap: () {
                            conceptFilterController.toggleFilterState(num, i);
                          },
                          child: toggleIcon(
                            conceptFilterController.filters[num][i].id,
                            conceptFilterController.filters[num][i].check,
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
                                conceptFilterController.toggleFilterState(
                                    num, i);
                              },
                              child: toggleIcon(
                                conceptFilterController.filters[num][i].id,
                                conceptFilterController.filters[num][i].check,
                              ),
                            )
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          for (var i = 3; i < 5; i++)
                            InkWell(
                              onTap: () {
                                conceptFilterController.toggleFilterState(
                                    num, i);
                              },
                              child: toggleIcon(
                                conceptFilterController.filters[num][i].id,
                                conceptFilterController.filters[num][i].check,
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

  Widget toggleIcon(String text, bool isCheck) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 6.0,
        left: 6.0,
      ),
      child: Container(
        height: 20.h,
        width: 10.w * text.length + 30,
        decoration: BoxDecoration(
          color: isCheck ? const Color(0xff3B75FF) : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 13.sp,
                color: isCheck ? Colors.white : const Color(0xff595959)),
          ),
        ),
      ),
    );
  }
}
