import 'package:bpp_riverpod/app/model/shop_detail_data.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/material.dart';

class DetailInfoPage extends StatelessWidget {
  const DetailInfoPage({
    Key? key,
    required this.priceImg,
    required this.map,
    required this.partners,
  }) : super(key: key);

  final String priceImg;
  final String map;
  final List<PartnershipData> partners;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Column(
            children: [
              const Text(
                '가격',
                style: BppTextStyle.defaultText,
              ),
              Image.network(
                priceImg,
                height: 380,
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Column(
            children: [
              const Text(
                '위치',
                style: BppTextStyle.defaultText,
              ),
              Image.network(
                map,
                height: 192,
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Column(
            children: [
              const Text(
                '제휴업체',
                style: BppTextStyle.defaultText,
              ),
              SizedBox(
                height: 110,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (var i = 0; i < partners.length; i++)
                      Column(
                        children: [
                          Image.network(
                            partners[i].profile,
                            height: 72,
                          ),
                          Text(
                            partners[i].name,
                            style: BppTextStyle.smallText,
                          ),
                        ],
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
