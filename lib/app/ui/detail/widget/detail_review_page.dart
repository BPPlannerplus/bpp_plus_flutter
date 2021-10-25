import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:bpp_riverpod/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailReviewPage extends StatelessWidget {
  const DetailReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          topReviewCard(),
          reviewCard(
            rating: 5,
            name: '김**',
            date: '21.09.25',
            text: '너무 만족스러워요',
          ),
          reviewCard(
            rating: 4,
            name: '이**',
            date: '21.09.16',
            text:
                '사진사 분께서 디렉팅을 잘해주셔서 너무 좋았어요! 찍을 때 많이 어색했는데, 디렉팅 덕분에 더 좋은 결과물 얻을 수 있었어요! 컨셉도 제가 생각하던 컨셉이라서 너무 좋았어요! 강추합니다!!',
          ),
          reviewCard(
            rating: 5,
            name: '김**',
            date: '21.09.25',
          ),
          reviewCard(
            rating: 4,
            name: '이**',
            date: '21.09.17',
            text:
                '사진사 분께서 디렉팅을 잘해주셔서 너무 좋았어요! 찍을 때 많이 어색했는데, 디렉팅 덕분에 더 좋은 결과물 얻을 수 있었어요! 컨셉도 제가 생각하던 컨셉이라서 너무 좋았어요! 강추합니다!!',
          ),
        ],
      ),
    );
  }

  Widget topReviewCard() {
    return Container(
      height: 72,
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '4.6',
            style: BppTextStyle.bigScreenText.copyWith(
              fontSize: 30,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          RatingBarIndicator(
            rating: 4.6,
            itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: Color(0xffffc142),
            ),
            itemCount: 5,
            itemSize: 25.0,
            direction: Axis.horizontal,
          ),
        ],
      ),
    );
  }

  Widget reviewCard({
    required double rating,
    required String name,
    required String date,
    String? text,
  }) {
    return Container(
      color: Colors.white,
      height: 148,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                name,
                style: BppTextStyle.filterText,
              ),
              Text(
                date,
                style: BppTextStyle.filterText.copyWith(
                  color: const Color(
                    0xffbfbfbf,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  locator<NavigationService>().navigateTo(
                    routeName: AppRoutes.reportPage,
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
              children: [
                RatingBarIndicator(
                  rating: rating,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Color(0xffffc142),
                  ),
                  itemCount: 5,
                  itemSize: 25.0,
                  direction: Axis.horizontal,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  '$rating',
                  style: BppTextStyle.filterText,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            color: Colors.white,
            child: text != null
                ? Text(
                    text,
                    style: BppTextStyle.filterText,
                  )
                : const SizedBox(),
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
