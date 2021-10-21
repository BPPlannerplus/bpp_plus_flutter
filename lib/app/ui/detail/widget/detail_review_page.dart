import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/material.dart';

class DetailReviewPage extends StatelessWidget {
  const DetailReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          reviewCard(context),
          reviewCard(context),
          reviewCard(context),
          reviewCard(context),
          reviewCard(context),
          reviewCard(context),
          reviewCard(context),
          reviewCard(context),
          reviewCard(context),
        ],
      ),
    );
  }

  Widget reviewCard(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 148,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                '김**',
                style: BppTextStyle.filterText,
              ),
              Text(
                '21.09.16',
                style: BppTextStyle.filterText.copyWith(
                  color: const Color(
                    0xffbfbfbf,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.reportPage,
                  );
                },
                child: Text(
                  '신고',
                  style: BppTextStyle.filterText.copyWith(
                    color: const Color(
                      0xffbfbfbf,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 20,
            color: Colors.white,
            child: Row(
              children: const [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            color: Colors.white,
            child: const Text(
              '리뷰 카드입니다',
              style: BppTextStyle.filterText,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            height: 1,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xfff2f2f2),
                  width: 2.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
