import 'package:bpp_riverpod/app/model/shop_detail_data.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/material.dart';

class DetailInfoPage extends StatelessWidget {
  const DetailInfoPage({
    Key? key,
    required this.priceImg,
    required this.map,
    required this.partners,
    required this.address,
  }) : super(key: key);

  final String priceImg;
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
              const Text(
                '가격',
                style: BppTextStyle.defaultText,
              ),
              const SizedBox(
                height: 12,
              ),
              Image.network(
                priceImg,
                height: 380,
                width: 328,
                fit: BoxFit.fill,
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '위치',
                style: BppTextStyle.defaultText,
              ),
              const SizedBox(
                height: 12,
              ),
              Image.network(
                map,
                height: 192,
                width: 328,
                fit: BoxFit.fill,
              ),
              Text(
                address,
                style: BppTextStyle.defaultText,
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '제휴업체',
                style: BppTextStyle.defaultText,
              ),
              const SizedBox(
                height: 12,
              ),
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
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              partners[i].name,
                              style: BppTextStyle.smallText,
                            ),
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
