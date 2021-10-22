import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReservationSchedulePage extends StatelessWidget {
  const ReservationSchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return emptyBox();
    // SliverGrid(
    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: 2,
    //     mainAxisExtent: 188,
    //     mainAxisSpacing: 5,
    //     crossAxisSpacing: 5,
    //   ),
    //   delegate: SliverChildBuilderDelegate(
    //     (BuildContext context, int index) {
    //       return Container(
    //         alignment: Alignment.center,
    //         color: Colors.lightGreen[100 * (index % 9)],
    //         child: Text(
    //           'Reservation Sche Item ${index + 1}',
    //           style: const TextStyle(fontSize: 20),
    //         ),
    //       );
    //     },
    //     childCount: 100,
    //   ),
    // );
  }

  Widget emptyBox() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(top: 70.h),
        child: Center(
          child: SvgPicture.asset(
            'assets/image/reservation_schedule_none.svg',
            width: 251.w,
            height: 154.h,
          ),
        ),
      ),
    );
  }
}
