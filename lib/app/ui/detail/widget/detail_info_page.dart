import 'package:bpp_riverpod/app/model/shop/shop_detail_data.dart';
import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/theme/color.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailInfoPage extends StatelessWidget {
  const DetailInfoPage({
    Key? key,
    required this.priceImg,
    required this.map,
    required this.partners,
    required this.address,
  }) : super(key: key);

  final String? priceImg;
  final String map;
  final List<PartnershipData> partners;
  final String address;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('가격', style: BppTextStyle.defaultText),
              const SizedBox(height: 12),
              priceImg == null
                  ? const Center(child: Text('가격 정보 없음'))
                  : Consumer(builder: (context, ref, _) {
                      final navigator = ref.watch(navigatorProvider);
                      return InkWell(
                        onTap: () {
                          navigator.navigateTo(
                            routeName: AppRoutes.detailPortfolioPage,
                            argument: priceImg,
                          );
                        },
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          height: 380,
                          width: 328.w,
                          padding: const EdgeInsets.all(2),
                          margin: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: BppColor.textFormBorder,
                              width: 1,
                            ),
                          ),
                          child: Hero(
                            tag: priceImg!,
                            child: Image.network(
                              priceImg!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    }),
            ],
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('위치', style: BppTextStyle.defaultText),
              const SizedBox(height: 12),
              Consumer(builder: (context, ref, _) {
                return InkWell(
                  onTap: () {
                    ref.read(navigatorProvider).navigateTo(
                          routeName: AppRoutes.detailPortfolioPage,
                          argument: map,
                        );
                  },
                  child: Container(
                    height: 192,
                    width: 328.w,
                    padding: const EdgeInsets.all(2),
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: BppColor.textFormBorder,
                        width: 1,
                      ),
                    ),
                    child: Image.network(map, fit: BoxFit.cover),
                  ),
                );
              }),
              Text(address, style: BppTextStyle.defaultText),
            ],
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('제휴업체', style: BppTextStyle.defaultText),
              const SizedBox(height: 12),
              SizedBox(
                height: 110,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (var i = 0; i < partners.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(right: 4, left: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              partners[i].profile,
                              height: 72,
                              width: 104,
                              fit: BoxFit.fill,
                            ),
                            const SizedBox(height: 12),
                            Text(partners[i].name,
                                style: BppTextStyle.smallText),
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
