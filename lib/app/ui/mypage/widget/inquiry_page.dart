import 'package:bpp_riverpod/app/model/mypage/mypage_data.dart';
import 'package:bpp_riverpod/app/model/mypage/mypage_shop_data.dart';
import 'package:bpp_riverpod/app/provider/mypage/inquiry_provider.dart';
import 'package:bpp_riverpod/app/ui/mypage/widget/empty_box.dart';
import 'package:bpp_riverpod/app/ui/mypage/widget/info_text.dart';
import 'package:bpp_riverpod/app/ui/mypage/widget/set_date_dialog.dart';
import 'package:bpp_riverpod/app/util/enum.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:bpp_riverpod/app/util/widget/custom_load_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              img: 'assets/image/inquiry_none.svg',
              topPadding: (MediaQuery.of(context).size.height - 256) / 4,
              isButton: true,
            )
          : SliverList(
              delegate: SliverChildListDelegate(
                [
                  infoText(),
                  titleRow(shopDatas.length),
                  for (MypageData shop in shopDatas)
                    inquiryCard(
                      shop.id,
                      shop: shop.shop,
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
          Text(
            '문의중 업체 $count',
            style: BppTextStyle.smallText,
          ),
          Consumer(builder: (context, ref, _) {
            final shopType = ref.watch(inquiryShopTypeProvider);
            return InkWell(
              onTap: () {
                ref.read(inquiryListProvider.notifier).deleteAll(shopType);
              },
              child: const Text(
                '전체 삭제',
                style: BppTextStyle.filterText,
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget inquiryCard(int reservationID, {required MypageShopData shop}) {
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
          Row(children: [
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
                  Text(
                    shopTypeToName[shop.type]!,
                    style: BppTextStyle.defaultText,
                  ),
                  const SizedBox(height: 10),
                  Text(shop.name,
                      style: BppTextStyle.tabText
                          .copyWith(fontWeight: FontWeight.w700))
                ])
          ]),
          Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Consumer(builder: (context, ref, _) {
                    return InkWell(
                        onTap: () {
                          ref
                              .read(inquiryListProvider.notifier)
                              .deleteById(reservationID);
                        },
                        child: const Icon(CupertinoIcons.xmark, size: 20));
                  }),
                ),
                SizedBox(
                    height: 33,
                    width: 100,
                    child: Consumer(builder: (context, ref, _) {
                      final navigator = ref.watch(navigatorProvider);
                      return ElevatedButton(
                          onPressed: () {
                            setDateDialog(
                              reservationID,
                              navigator.navigatorKey.currentContext!,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              primary: const Color(0xff3b75ff), elevation: 0),
                          child: Center(
                              child: Text('일정입력',
                                  style: BppTextStyle.smallText.copyWith(
                                      color: const Color(0xffffffff),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14))));
                    }))
              ])
        ]));
  }
}
