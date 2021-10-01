import 'package:bpp_plus_flutter/app/controller/concept_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ConceptBottomSheet extends StatelessWidget {
  ConceptBottomSheet({Key? key}) : super(key: key);

  final controller = Get.find<ConceptController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15.h, left: 20.w, right: 20.w),
      height: 500.h,
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
                  fontSize: 22.sp,
                ),
              ),
              InkWell(
                onTap: () {
                  controller.refreshFilterState();
                },
                child: const Image(
                  image: AssetImage('assets/icons/ic_reset.png'),
                ),
              ),
            ],
          ),
          filterColumn('인원', 0),
          filterColumn('성별', 1),
          filterColumn('배경', 2),
          filterColumn('소품', 3),
          filterColumn('의상', 4),
          ElevatedButton(
            onPressed: () {
              controller.makeFilter();
              Get.back();
            },
            child: Container(
              width: 328.w,
              height: 48.h,
              child: const Center(
                child: Text('선택완료'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget filterColumn(String title, int num) {
    return GetBuilder(
      init: controller,
      builder: (_) => Container(
        padding: EdgeInsets.all(5.w),
        height: 70.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18.sp,
              ),
            ),
            SizedBox(height: 8.h),
            ToggleButtons(
              children: [
                for (var i = 0; i < controller.filters[num].length; i++)
                  Container(
                    height: 25.h,
                    width: 20.w * controller.filters[num][i].id.length,
                    decoration: BoxDecoration(
                      color: controller.filters[num][i].check
                          ? Colors.lightBlueAccent
                          : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        controller.filters[num][i].id,
                        style: TextStyle(
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  ),
              ],
              onPressed: (index) {
                controller.toggleFilterState(num, index);
              },
              isSelected: [
                for (var filter in controller.filters[num]) filter.check
              ],
              renderBorder: false,
              selectedColor: Colors.white,
              fillColor: Colors.white,
              splashColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
