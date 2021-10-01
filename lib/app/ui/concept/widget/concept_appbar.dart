import 'package:bpp_plus_flutter/app/controller/concept_controller.dart';
import 'package:bpp_plus_flutter/app/ui/concept/widget/concept_bottom_sheet.dart';
import 'package:bpp_plus_flutter/app/ui/concept/widget/filter_paint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ConceptAppBar extends StatelessWidget {
  ConceptAppBar({Key? key}) : super(key: key);

  final controller = Get.find<ConceptController>();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      pinned: true,
      backgroundColor: Colors.white,
      expandedHeight: 110.h,
      toolbarHeight: 110.h,
      title: Container(
        padding: EdgeInsets.only(
          top: 15.h,
        ),
        child: Text(
          '원하는 컨셉의\n스튜디오를 찾아보세요',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25.sp,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 16.w, top: 30.h),
          child: Row(
            children: [
              Container(
                height: 40.w,
                width: 40.w,
                color: Colors.white,
                child: CircleAvatar(
                  radius: 20.w,
                  backgroundColor: Colors.grey.shade100,
                  child: Image(
                    image:
                        const AssetImage('assets/icons/ic_like_small_off.png'),
                    width: 25.w,
                    height: 25.h,
                  ),
                ),
              ),
              SizedBox(
                width: 5.w,
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
                  height: 40.w,
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
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(41.h),
        child: Container(
          margin: EdgeInsets.only(right: 16.w, left: 16.w),
          height: 41.h,
          width: Get.size.width,
          decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey))),
          child: GetBuilder(
            init: controller,
            builder: (_) => Row(
              children: [
                filterCard(controller.conceptFilter.headNum[0]),
                filterCard(controller.conceptFilter.gender[0]),
                filterCard(controller.conceptFilter.background[0]),
                filterCard(controller.conceptFilter.prop[0]),
                filterCard(controller.conceptFilter.cloth[0]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget filterCard(String title) {
    if (title.isEmpty) {
      return Container();
    }
    return Container(
      padding: const EdgeInsets.all(4),
      height: 26.h,
      width: 10.w * title.length + 30,
      child: CustomPaint(
        painter: ConceptPaint(),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.lightBlueAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
