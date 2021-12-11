import 'package:bpp_riverpod/app/util/format.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/material.dart';

class DetailMidBox extends StatelessWidget {
  const DetailMidBox({
    Key? key,
    required this.shopName,
    this.price,
    required this.logo,
  }) : super(key: key);

  final String shopName;
  final int? price;
  final String logo;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
        height: 80,
        color: Colors.white,
        child: Row(
          children: [
            CircleAvatar(
              radius: 32,
              backgroundColor: const Color(0xffbfbfbf),
              child: CircleAvatar(
                radius: 31,
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(logo),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shopName,
                  style: BppTextStyle.screenText.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  price != null ? priceFormat(price!) : '가격 정보 없음',
                  style: BppTextStyle.defaultText,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
