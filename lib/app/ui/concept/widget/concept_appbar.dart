import 'package:bpp_plus_flutter/app/controller/concept_controller.dart';
import 'package:bpp_plus_flutter/app/controller/concept_filter_controller.dart';
import 'package:bpp_plus_flutter/app/ui/concept/widget/concept_bottom_sheet.dart';
import 'package:bpp_plus_flutter/app/ui/concept/widget/filter_paint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ConceptAppBar extends StatelessWidget {
  ConceptAppBar({Key? key}) : super(key: key);

  final conceptController = Get.find<ConceptController>();
  final conceptFilterController = Get.find<ConceptFilterController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 44.h,
        right: 16.w,
        left: 16.w,
      ),
      color: Colors.white,
      height: 155.h,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Text(
                  '원하는 컨셉의\n스튜디오를 찾아보세요',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              InkWell(
                onTap: () {
                  Get.bottomSheet(
                    ConceptBottomSheet(),
                    ignoreSafeArea: false,
                    isScrollControlled: true,
                  );
                },
                child: Container(
                  height: 40.h,
                  width: 40.w,
                  color: Colors.white,
                  child: CircleAvatar(
                    radius: 20.w,
                    backgroundColor: Colors.grey.shade100,
                    child: Image(
                      image: const AssetImage('assets/icons/ic_filter.png'),
                      width: 25.w,
                      height: 25.h,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Container(
            padding: EdgeInsets.only(top: 10.h),
            height: 40.h,
            width: Get.size.width,
            decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey))),
            child: GetBuilder(
              init: conceptFilterController,
              builder: (_) => Row(
                children: [
                  filterCard(conceptController.filter.headNum[0]),
                  filterCard(conceptController.filter.gender[0]),
                  filterCard(conceptController.filter.background[0]),
                  filterCard(conceptController.filter.prop[0]),
                  filterCard(conceptController.filter.cloth[0]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget filterCard(String title) {
    if (title.isEmpty) {
      return Container();
    }
    return Container(
      padding: EdgeInsets.only(right: 2.w, left: 2.w),
      height: 28.h,
      width: 5.w * title.length + 45.w,
      child: CustomPaint(
        painter: ConceptPaint(),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 13.sp,
              color: const Color(0xff3B75FF),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
