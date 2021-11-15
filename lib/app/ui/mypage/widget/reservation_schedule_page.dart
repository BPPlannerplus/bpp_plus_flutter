import 'package:bpp_riverpod/app/model/mypage/mypage_data.dart';
import 'package:bpp_riverpod/app/provider/mypage/confirmed_provider.dart';
import 'package:bpp_riverpod/app/ui/mypage/widget/reservation_card.dart';
import 'package:bpp_riverpod/app/ui/mypage/widget/reservation_detail_dialog.dart';
import 'package:bpp_riverpod/app/util/enum.dart';
import 'package:bpp_riverpod/app/util/format.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ReservationSchedulePage extends ConsumerStatefulWidget {
  const ReservationSchedulePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ReservationSchedulePage> createState() =>
      _ReservationSchedulePageState();
}

class _ReservationSchedulePageState
    extends ConsumerState<ReservationSchedulePage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () async {
      await ref.watch(confirmedListProvider.notifier).getList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final confirmList = ref.watch(confirmedListProvider);

    if (ref.watch(isConfirmedLoading)) {
      return const SliverToBoxAdapter(
          child: SizedBox(
              height: 250, child: Center(child: CircularProgressIndicator())));
    } else {
      final shopDatas = ref.watch(confirmedListProvider.notifier).makeList();
      return confirmList.isEmpty
          ? emptyBox()
          : SliverList(
              delegate: SliverChildListDelegate([
              for (var shopData in shopDatas) reservationCards(shopData),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
                Padding(
                    padding: EdgeInsets.only(top: 6, bottom: 16, left: 18),
                    child: CircleAvatar(
                        radius: 4, backgroundColor: Color(0xff4c81ff)))
              ])
            ]));
    }
  }

  Widget reservationDivider(int day) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
              padding: EdgeInsets.all(6.0),
              child:
                  CircleAvatar(radius: 4, backgroundColor: Color(0xff4c81ff))),
          const SizedBox(width: 12),
          RichText(
              text: TextSpan(
                  text: '${day + 1}',
                  style: BppTextStyle.tabText
                      .copyWith(color: const Color(0xff3b75ff), fontSize: 16),
                  children: [
                TextSpan(
                    text: '일 남았어요!',
                    style: BppTextStyle.tabText
                        .copyWith(color: const Color(0xff595959), fontSize: 16))
              ]))
        ]);
  }

  Widget reservationCards(List<MypageData> shopDatas) {
    final remainingDay = calRemainigDay(shopDatas[0].reservedData!);
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Column(
        children: [
          reservationDivider(remainingDay),
          for (int i = 0; i < shopDatas.length; i++)
            Padding(
              padding: const EdgeInsets.only(left: 9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: 1, height: 120.h, color: const Color(0xff000000)),
                  const SizedBox(width: 22),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Consumer(builder: (context, ref, _) {
                      final navigator = ref.watch(navigatorProvider);
                      return reservationCard(
                        date: reservationDateFormat(shopDatas[i].reservedData!),
                        shop: shopTypeToName[shopDatas[i].shop.type]!,
                        shopName: shopDatas[i].shop.name,
                        buttonText: '문의하기',
                        iconWidget: SvgPicture.asset(
                          'assets/icon/ic_edit.svg',
                          width: 40,
                        ),
                        onTabButton: () async {
                          await launch(shopDatas[i].shop.kakaoUrl);
                        },
                        onTabIcon: () {
                          reservationDetailDialog(
                            shopDatas[i].id,
                            navigator.navigatorKey.currentContext!,
                          );
                        },
                      );
                    }),
                  ),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(left: 9),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: 1, height: 28, color: const Color(0xff000000)),
                ]),
          ),
        ],
      ),
    );
  }

  Widget emptyBox() {
    return SliverToBoxAdapter(
        child: Padding(
            padding: EdgeInsets.only(top: 70.h),
            child: Center(
                child: SvgPicture.asset(
                    'assets/image/reservation_schedule_none.svg',
                    width: 251.w))));
  }
}
