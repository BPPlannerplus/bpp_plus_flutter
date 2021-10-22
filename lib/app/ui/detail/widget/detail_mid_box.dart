import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/material.dart';

class DetailMidBox extends StatelessWidget {
  const DetailMidBox({
    Key? key,
    required this.shopName,
    required this.price,
    required this.logo,
  }) : super(key: key);

  final String shopName;
  final int price;
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
              // backgroundColor: const Color(0xffc4c4c4),
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(logo),
            ),
            const SizedBox(
              width: 16,
            ),
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
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '$price',
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
