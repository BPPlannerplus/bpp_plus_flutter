import 'dart:math';

import 'package:bpp_riverpod/app/model/enum/shop_type.dart';
import 'package:bpp_riverpod/app/model/mypage/mypage_shop_data.dart';
import 'package:bpp_riverpod/app/provider/mypage/inquiry_provider.dart';
import 'package:bpp_riverpod/app/provider/mypage/reservation_check_provider.dart';
import 'package:bpp_riverpod/app/provider/navigation_provider.dart';
import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/ui/components/state/custom_load_indicator.dart';
import 'package:bpp_riverpod/app/ui/mypage/widget/empty_box.dart';
import 'package:bpp_riverpod/app/ui/mypage/widget/info_text.dart';
import 'package:bpp_riverpod/app/ui/mypage/widget/set_date_dialog.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InquiryPage extends ConsumerStatefulWidget {
  const InquiryPage({Key? key}) : super(key: key);

  @override
  ConsumerState<InquiryPage> createState() => _InquiryPageState();
}

class _InquiryPageState extends ConsumerState<InquiryPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () async {
      await ref.read(inquiryListProvider.notifier).getList();
      ref.read(inquiryShopTypeProvider.state).state = ShopType.stduio;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final inquiryList = ref.watch(inquiryListProvider);
    final shopType = ref.watch(inquiryShopTypeProvider);
    final shopDatas =
        inquiryList.where((data) => data.shop.type == shopType.index).toList();

    if (ref.watch(isInquiryLoading)) {
      return SliverToBoxAdapter(
        child: SizedBox(
          height: 250,
          child: customLoadingIndicator(),
        ),
      );
    } else {
      return shopDatas.isEmpty
          ? emptyBox(
              isButton: true,
              title: '문의 중인 스튜디오가 없어요.',
              subTitle: '마음에 드는 스튜디오를 예약해보세요.',
            )
          : SliverList(
              delegate: SliverChildListDelegate(
                [
                  infoText(),
                  titleRow(shopDatas.length),
                  for (int i = 0; i < shopDatas.length; i++)
                    if (i == 0)
                      _inquiryCardWithBubble(
                        reservationId: shopDatas[i].id,
                        shop: shopDatas[i].shop,
                      )
                    else
                      inquiryCard(
                        reservationId: shopDatas[i].id,
                        shop: shopDatas[i].shop,
                      )
                ],
              ),
            );
    }
  }

  Widget titleRow(int count) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('문의중 업체 $count', style: BppTextStyle.smallText),
        ],
      ),
    );
  }

  Widget inquiryCard({
    required int reservationId,
    required MypageShopData shop,
  }) {
    return Container(
        padding: const EdgeInsets.only(top: 16, bottom: 12),
        height: 107,
        width: 327,
        decoration: BoxDecoration(
            border: Border(
                bottom:
                    BorderSide(color: const Color(0xfff2f2f2), width: 1.0.h))),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              CircleAvatar(
                  radius: 32,
                  backgroundColor: const Color(0xffbfbfbf),
                  child: CircleAvatar(
                      radius: 31, backgroundImage: NetworkImage(shop.logo))),
              const SizedBox(width: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(shopTypeToString(shop.type),
                      style: BppTextStyle.defaultText),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(shop.name,
                          style: BppTextStyle.tabText
                              .copyWith(fontWeight: FontWeight.w700)),
                      const SizedBox(width: 4),
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: InkWell(
                            onTap: () {
                              ref.read(navigatorProvider).navigateTo(
                                    routeName: AppRoutes.detailPage,
                                    argument: shop.id,
                                  );
                            },
                            child: Transform.rotate(
                                angle: pi,
                                child: Icon(Icons.arrow_back_ios_new,
                                    color: const Color(0xff000000),
                                    size: 12.sp))),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Consumer(builder: (context, ref, _) {
                    return InkWell(
                        onTap: () async {
                          await ref
                              .read(inquiryListProvider.notifier)
                              .deleteById(reservationId);
                        },
                        child: const Icon(CupertinoIcons.xmark, size: 20));
                  }),
                ),
                SizedBox(
                    height: 33,
                    width: 100,
                    child: Consumer(builder: (context, ref, _) {
                      return ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => setDateDialog(
                                reservationId: reservationId,
                                confirm: (id, date) {
                                  ref
                                      .read(inquiryListProvider.notifier)
                                      .changeState(id, date);
                                  ref.read(myPageTabProvider.state).state = 1;
                                },
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              primary: const Color(0xff3b75ff), elevation: 0),
                          child: Center(
                              child: Text('일정입력',
                                  style: BppTextStyle.smallText.copyWith(
                                      color: const Color(0xffffffff)))));
                    }))
              ])
        ]));
  }

  Widget _inquiryCardWithBubble({
    required int reservationId,
    required MypageShopData shop,
  }) {
    return Consumer(builder: (context, ref, _) {
      final showTooltip = ref.watch(reservationCheckProvider);

      return Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 16, bottom: 12),
            height: 107,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: const Color(0xfff2f2f2), width: 1.0.h))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  CircleAvatar(
                      radius: 32,
                      backgroundColor: const Color(0xffbfbfbf),
                      child: CircleAvatar(
                          radius: 31,
                          backgroundImage: NetworkImage(shop.logo))),
                  const SizedBox(width: 16),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(shopTypeToString(shop.type),
                            style: BppTextStyle.defaultText),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Text(shop.name,
                                style: BppTextStyle.tabText
                                    .copyWith(fontWeight: FontWeight.w700)),
                            const SizedBox(width: 4),
                            Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: InkWell(
                                  onTap: () {
                                    ref.read(navigatorProvider).navigateTo(
                                          routeName: AppRoutes.detailPage,
                                          argument: shop.id,
                                        );
                                  },
                                  child: Transform.rotate(
                                      angle: pi,
                                      child: Icon(Icons.arrow_back_ios_new,
                                          color: const Color(0xff000000),
                                          size: 12.sp))),
                            )
                          ],
                        ),
                      ])
                ]),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: InkWell(
                            onTap: () async {
                              await ref
                                  .read(inquiryListProvider.notifier)
                                  .deleteById(reservationId);
                            },
                            child: const Icon(CupertinoIcons.xmark, size: 20))),
                    SizedBox(
                        height: 33,
                        width: 100,
                        child: ElevatedButton(
                            onPressed: () {
                              ref
                                  .read(reservationCheckStateProvider.state)
                                  .state = true;
                              showDialog(
                                context: context,
                                builder: (context) => setDateDialog(
                                  reservationId: reservationId,
                                  confirm: (id, date) {
                                    ref
                                        .read(inquiryListProvider.notifier)
                                        .changeState(id, date);
                                    ref.read(myPageTabProvider.state).state = 1;
                                  },
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                primary: const Color(0xff3b75ff), elevation: 0),
                            child: Center(
                                child: Text('일정입력',
                                    style: BppTextStyle.smallText.copyWith(
                                        color: const Color(0xffffffff))))))
                  ],
                ),
              ],
            ),
          ),
          !showTooltip
              ? Align(
                  alignment: Alignment.topRight,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/image/bubble.svg',
                        height: 48,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 9),
                        child: Text(
                          '예약된 일정을 입력해보세요',
                          style: BppTextStyle.smallText.copyWith(
                            color: const Color(0xff3b75ff),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : const SizedBox(),
        ],
      );
    });
  }
}
