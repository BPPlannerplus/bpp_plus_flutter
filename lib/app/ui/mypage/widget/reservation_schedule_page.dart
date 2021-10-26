import 'package:bpp_riverpod/app/ui/mypage/widget/reservation_card.dart';
import 'package:bpp_riverpod/app/ui/mypage/widget/reservation_dialog.dart';
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
            reservationCard(
              date: '9월 27일',
              shop: '태닝',
              shopName: '스티븐백',
              buttonText: '문의하기',
              iconWidget: SvgPicture.asset(
                'assets/icon/ic_edit.svg',
              ),
              onTabButton: () {},
              onTabIcon: () {
                reservationDetailDialog();
              },
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
