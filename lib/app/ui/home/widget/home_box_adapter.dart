import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeBoxAdpater extends StatelessWidget {
  const HomeBoxAdpater({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(top: 48),
        height: 151,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'assets/image/home_sub.svg',
              width: 113,
              height: 20,
            ),
            const SizedBox(
              height: 5,
            ),
            SvgPicture.asset(
              'assets/image/home_title.svg',
              width: 154,
              height: 62,
            ),
          ],
        ),
      ),
    );
  }
}
