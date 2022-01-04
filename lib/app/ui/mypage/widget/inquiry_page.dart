import 'package:bpp_riverpod/app/model/enum/shop_type.dart';
import 'package:bpp_riverpod/app/provider/mypage/inquiry_provider.dart';
import 'package:bpp_riverpod/app/ui/components/state/custom_load_indicator.dart';
import 'package:bpp_riverpod/app/ui/mypage/widget/empty_box.dart';
import 'package:bpp_riverpod/app/ui/mypage/widget/info_text.dart';
import 'package:bpp_riverpod/app/ui/mypage/widget/inquiry_card.dart';
import 'package:bpp_riverpod/app/ui/mypage/widget/inquiry_card_with_bubble.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      ref.read(inquiryShopTypeProvider.state).state = ShopType.studio;
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
          ? const EmptyBox(
              isButton: true,
              title: '문의 중인 스튜디오가 없어요.',
              subTitle: '마음에 드는 스튜디오를 예약해보세요.',
            )
          : SliverList(
              delegate: SliverChildListDelegate(
                [
                  const InfoText(),
                  _TitleRow(
                    count: shopDatas.length,
                  ),
                  for (int i = 0; i < shopDatas.length; i++)
                    if (i == 0)
                      InquiryCardWithBubble(
                        reservationId: shopDatas[i].id,
                        shop: shopDatas[i].shop,
                      )
                    else
                      InquiryCard(
                        reservationId: shopDatas[i].id,
                        shop: shopDatas[i].shop,
                      )
                ],
              ),
            );
    }
  }
}

class _TitleRow extends StatelessWidget {
  const _TitleRow({
    Key? key,
    required this.count,
  }) : super(key: key);

  final int count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('문의중 업체 $count', style: BppTextStyle.smallText),
          Consumer(builder: (context, ref, _) {
            //  TODO: 샵 전체 삭제 수정, 클라쪽에서 500에러
            final shopType = ref.watch(inquiryShopTypeProvider);
            return InkWell(
              onTap: () {
                ref
                    .read(inquiryListProvider.notifier)
                    .deleteByShopType(shopType);
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
}
