import 'package:bpp_riverpod/app/model/mypage/mypage_data.dart';
import 'package:bpp_riverpod/app/provider/mypage/confirmed_provider.dart';
import 'package:bpp_riverpod/app/ui/components/state/custom_load_indicator.dart';
import 'package:bpp_riverpod/app/ui/mypage/widget/empty_box.dart';
import 'package:bpp_riverpod/app/ui/mypage/widget/reservation_card.dart';
import 'package:bpp_riverpod/app/ui/mypage/widget/reservation_detail_dialog.dart';
import 'package:bpp_riverpod/app/util/format.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      return SliverToBoxAdapter(
          child: SizedBox(height: 250, child: customLoadingIndicator()));
    } else {
      final shopDatas = ref.watch(confirmedListProvider.notifier).makeList();
      return confirmList.isEmpty
          ? const EmptyBox(
              isButton: false,
              title: '아직 예약한 스튜디오가 없어요.',
              subTitle: '예약 날짜를 입력하고 예약을 관리해보세요')
          : SliverList(
              delegate: SliverChildListDelegate(
                [
                  for (int i = 0; i < shopDatas.length; i++)
                    if (i == shopDatas.length - 1)
                      _lastCard(shopDatas[i])
                    else
                      reservationCards(shopDatas[i])
                ],
              ),
            );
    }
  }

  Widget reservationDivider(int day) {
    return Row(
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
        const SizedBox(width: 12),
        RichText(
          text: TextSpan(
            text: '$day',
            style: BppTextStyle.tabText
                .copyWith(color: const Color(0xff3b75ff), fontSize: 16),
            children: [
              TextSpan(
                text: '일 남았어요!',
                style: BppTextStyle.tabText.copyWith(
                  color: const Color(0xff595959),
                  fontSize: 16,
                ),
              )
            ],
          ),
        )
      ],
    );
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
                    width: 1,
                    height: 120,
                    color: const Color(0xff000000),
                  ),
                  const SizedBox(width: 22),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Consumer(
                      builder: (context, ref, _) {
                        return ReservationCard(
                          mypageData: shopDatas[i],
                          buttonText: '문의하기',
                          isButton: true,
                          iconWidget: SvgPicture.asset(
                            'assets/icon/ic_edit.svg',
                            width: 40,
                          ),
                          onTabButton: () async {
                            await launch(shopDatas[i].shop.kakaoUrl);
                          },
                          onTabIcon: () {
                            showDialog(
                                context: context,
                                builder: (context) => ReservationDetailDialog(
                                    reservationData: shopDatas[i]));
                          },
                        );
                      },
                    ),
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

  Widget _lastCard(List<MypageData> shopDatas) {
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
                  const SizedBox(width: 22),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Consumer(builder: (context, ref, _) {
                      return ReservationCard(
                        isButton: true,
                        mypageData: shopDatas[i],
                        buttonText: '문의하기',
                        iconWidget: SvgPicture.asset(
                          'assets/icon/ic_edit.svg',
                          width: 40,
                        ),
                        onTabButton: () async {
                          await launch(shopDatas[i].shop.kakaoUrl);
                        },
                        onTabIcon: () {
                          showDialog(
                              context: context,
                              builder: (context) => ReservationDetailDialog(
                                  reservationData: shopDatas[i]));
                        },
                      );
                    }),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
