import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReservationSchedulePage extends StatelessWidget {
  const ReservationSchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return emptyBox();
    return reservationLists();
  }

  Widget reservationLists() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          reservationCards(1),
          reservationCards(12),
          reservationCards(13),
        ],
      ),
    );
  }

  Widget reservationCards(int day) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(6.0),
              child: CircleAvatar(
                radius: 4,
                backgroundColor: Color(0xff4c81ff),
              ),
            ),
            Container(
              width: 1,
              height: 150,
              color: const Color(0xff000000),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$day일 남았어요!',
              style: BppTextStyle.tabText.copyWith(
                color: const Color(0xff595959),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 105,
              width: 288,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xffdfdfdf),
              ),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.only(top: 8, left: 20, right: 8),
                  height: 103,
                  width: 286,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xffffffff),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '9월 27일',
                            style: BppTextStyle.defaultText,
                          ),
                          Text(
                            '태닝',
                            style: BppTextStyle.smallText.copyWith(
                              color: const Color(0xff696969),
                            ),
                          ),
                          Text(
                            '스티븐백',
                            style: BppTextStyle.defaultText.copyWith(
                              color: const Color(0xff010101),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Icon(
                            CupertinoIcons.pencil,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xfff2f2f2),
                              elevation: 0,
                            ),
                            child: Text(
                              '문의하기',
                              style: BppTextStyle.smallText.copyWith(
                                color: const Color(0xff595959),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
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
