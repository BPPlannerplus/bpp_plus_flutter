import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/ui/mypage/widget/reservation_card.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReservationDetailPage extends StatelessWidget {
  const ReservationDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return emptyBox();
    return reservedList();
  }

  Widget reservedList() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor: Color(0xff4c81ff),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  '이전 예약 내역을 확인해보세요',
                  style: BppTextStyle.tabText,
                )
              ],
            ),
          ),
          for (int i = 0; i < 5; i++)
            Padding(
              padding: const EdgeInsets.only(left: 21),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 1,
                    height: 130,
                    color: const Color(0xff000000),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: reservationCard(
                      date: '9월 27일',
                      shop: '태닝',
                      shopName: '스티븐백',
                      buttonText: '리뷰 작성',
                      iconWidget: Text(
                        '다시 추가하기',
                        style: BppTextStyle.smallText.copyWith(
                          color: const Color(0xff3b75ff),
                        ),
                      ),
                      onTabButton: () {
                        locator<NavigationService>().navigateTo(
                          routeName: AppRoutes.reviewWritePage,
                        );
                      },
                      onTabIcon: () {},
                    ),
                  ),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(left: 21),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 1,
                  height: 130,
                  color: const Color(0xff000000),
                ),
                const SizedBox(
                  width: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: reservationCard(
                    date: '9월 27일',
                    shop: '태닝',
                    shopName: '스티븐백',
                    buttonText: '내 리뷰 보기',
                    iconWidget: Text(
                      '다시 추가하기',
                      style: BppTextStyle.smallText.copyWith(
                        color: const Color(0xff3b75ff),
                      ),
                    ),
                    onTabButton: () {
                      locator<NavigationService>().navigateTo(
                        routeName: AppRoutes.myReviewPage,
                      );
                    },
                    onTabIcon: () {},
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 4, bottom: 16, left: 18),
                child: CircleAvatar(
                  radius: 4,
                  backgroundColor: Color(0xff4c81ff),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget reservedCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 1,
          height: 130,
          color: const Color(0xff000000),
        ),
        reservationCard(
          date: '9월 27일',
          shop: '태닝',
          shopName: '스티븐백',
          buttonText: '리뷰 작성',
          iconWidget: Text(
            '다시 추가하기',
            style: BppTextStyle.smallText.copyWith(
              color: const Color(0xff3b75ff),
            ),
          ),
          onTabButton: () {
            locator<NavigationService>().navigateTo(
              routeName: AppRoutes.reviewWritePage,
            );
          },
          onTabIcon: () {},
        ),
      ],
    );
  }

  Widget emptyBox() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(top: 70.h),
        child: Center(
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/image/reservation_detail_none.svg',
                width: 221.w,
                height: 154.h,
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  '스튜디오 보러가기',
                  style: BppTextStyle.defaultText.copyWith(
                    color: const Color(0xffffffff),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
