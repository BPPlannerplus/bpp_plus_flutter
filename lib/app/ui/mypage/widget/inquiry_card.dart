import 'dart:math';

import 'package:bpp_riverpod/app/model/enum/shop_type.dart';
import 'package:bpp_riverpod/app/model/mypage/mypage_shop_data.dart';
import 'package:bpp_riverpod/app/provider/mypage/inquiry_provider.dart';
import 'package:bpp_riverpod/app/provider/navigation_provider.dart';
import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/ui/components/card/circle_avatar_card.dart';
import 'package:bpp_riverpod/app/ui/mypage/widget/set_date_dialog.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/theme/color.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InquiryCard extends StatelessWidget {
  const InquiryCard({
    Key? key,
    required this.reservationId,
    required this.shop,
  }) : super(key: key);

  final int reservationId;
  final MypageShopData shop;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, bottom: 12),
      height: 107,
      width: 327,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: const Color(0xfff2f2f2),
            width: 1.0.h,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatarCard(
                backgroundColor: const Color(0xffbfbfbf),
                img: shop.logo,
              ),
              const SizedBox(width: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shopTypeToString(shop.type),
                    style: BppTextStyle.smallText.copyWith(
                      color: BppColor.unSelText,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(shop.name,
                          style: BppTextStyle.tabText
                              .copyWith(fontWeight: FontWeight.w700)),
                      const SizedBox(width: 4),
                      Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: Consumer(
                          builder: (context, ref, _) {
                            return InkWell(
                              onTap: () {
                                ref.read(navigatorProvider).navigateTo(
                                    routeName: AppRoutes.detailPage,
                                    argument: shop.id);
                              },
                              child: Transform.rotate(
                                angle: pi,
                                child: Icon(
                                  Icons.arrow_back_ios_new,
                                  color: const Color(0xff000000),
                                  size: 12.sp,
                                ),
                              ),
                            );
                          },
                        ),
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
                    child: const Icon(
                      CupertinoIcons.xmark,
                      size: 20,
                    ),
                  );
                }),
              ),
              SizedBox(
                height: 33,
                width: 100,
                child: Consumer(
                  builder: (context, ref, _) {
                    return ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => SetDateDialog(
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
                        primary: const Color(0xff3b75ff),
                        elevation: 0,
                      ),
                      child: Center(
                        child: Text(
                          '일정입력',
                          style: BppTextStyle.smallText.copyWith(
                            color: const Color(0xffffffff),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
