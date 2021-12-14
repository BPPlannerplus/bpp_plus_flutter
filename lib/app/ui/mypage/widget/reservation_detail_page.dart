import 'package:bpp_riverpod/app/model/mypage/mypage_data.dart';
import 'package:bpp_riverpod/app/provider/mypage/expiration_provider.dart';
import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/ui/components/state/custom_load_indicator.dart';
import 'package:bpp_riverpod/app/ui/mypage/widget/empty_box.dart';
import 'package:bpp_riverpod/app/ui/mypage/widget/reservation_card.dart';
import 'package:bpp_riverpod/app/ui/mypage/widget/set_date_dialog.dart';
import 'package:bpp_riverpod/app/util/enum.dart';
import 'package:bpp_riverpod/app/util/format.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReservationDetailPage extends ConsumerStatefulWidget {
  const ReservationDetailPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ReservationDetailPage> createState() =>
      _ReservationDetailPageState();
}

class _ReservationDetailPageState extends ConsumerState<ReservationDetailPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () async {
      await ref.read(expirationListProvider.notifier).getList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final expirationList = ref.watch(expirationListProvider);

    if (ref.watch(isExpirationLoading)) {
      return SliverToBoxAdapter(
          child: SizedBox(height: 250, child: customLoadingIndicator()));
    } else {
      return expirationList.isEmpty
          ? emptyBox(
              isButton: true,
              title: '아직 예약 내역이 없어요.',
              subTitle: '마음에 드는 스튜디오를 예약해보세요.')
          : reservedList(expirationList);
    }
  }

  Widget reservedList(List<MypageData> datas) {
    return SliverList(
        delegate: SliverChildListDelegate([
      Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Padding(
                    padding: EdgeInsets.all(6.0),
                    child: CircleAvatar(
                        radius: 4, backgroundColor: Color(0xff4c81ff))),
                SizedBox(width: 16),
                Text('이전 예약 내역을 확인해보세요', style: BppTextStyle.tabText)
              ])),
      for (int i = 0; i < datas.length; i++)
        Padding(
          padding: const EdgeInsets.only(left: 21),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(width: 1, height: 120, color: const Color(0xff000000)),
              const SizedBox(width: 22),
              Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Consumer(builder: (context, ref, _) {
                    final navigator = ref.watch(navigatorProvider);
                    return reservationCard(
                      shopId: datas[i].shop.id,
                      date: reservationDateFormat(datas[i].reservedData!),
                      shop: shopTypeToName[datas[i].shop.type]!,
                      shopName: datas[i].shop.name,
                      buttonText: datas[i].state == 2 ? '내 리뷰 보기' : '리뷰 작성',
                      iconWidget: Padding(
                        padding: EdgeInsets.only(top: 8, right: 8.w),
                        child: Text(
                          '다시 추가하기',
                          style: BppTextStyle.smallText.copyWith(
                            color: const Color(0xff3b75ff),
                          ),
                        ),
                      ),
                      onTabButton: datas[i].state == 2
                          ? () {
                              navigator.navigateTo(
                                routeName: AppRoutes.myReviewPage,
                                argument: ReviewArgs(
                                    id: datas[i].id,
                                    shopType:
                                        shopTypeToName[datas[i].shop.type]!,
                                    shopName: datas[i].shop.name),
                              );
                            }
                          : () {
                              navigator.navigateTo(
                                routeName: AppRoutes.reviewWritePage,
                                argument: ReviewArgs(
                                    id: datas[i].id,
                                    shopType:
                                        shopTypeToName[datas[i].shop.type]!,
                                    shopName: datas[i].shop.name),
                              );
                            },
                      onTabIcon: () async {
                        showDialog(
                          context: context,
                          builder: (context) => setDateDialog(
                            reservationId: datas[i].id,
                            confirm: (id, date) {},
                          ),
                        );
                      },
                    );
                  }))
            ],
          ),
        ),
      Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
        Padding(
            padding: EdgeInsets.only(top: 4, bottom: 16, left: 18),
            child: CircleAvatar(radius: 4, backgroundColor: Color(0xff4c81ff)))
      ])
    ]));
  }
}
