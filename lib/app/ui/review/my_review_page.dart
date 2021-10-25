import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:bpp_riverpod/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MyReviewPage extends StatelessWidget {
  const MyReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            '리뷰 작성하기',
            style: BppTextStyle.defaultText,
          ),
          leading: InkWell(
            onTap: () {
              locator<NavigationService>().pop();
            },
            child: const Icon(
              Icons.arrow_back,
              color: Color(0xff000000),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                height: 63,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xffe6e6e6),
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      '스튜디오',
                      style: BppTextStyle.smallText
                          .copyWith(color: const Color(0xff4d4d4d)),
                    ),
                    const Text(
                      '아날로그핏',
                      style: BppTextStyle.tabText,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 96,
                child: Column(
                  children: [
                    const Text(
                      '만족스러우셨나요?\n경험을 공유해주세요!',
                      style: BppTextStyle.tabText,
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
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  '등록하기',
                  style: BppTextStyle.tabText.copyWith(
                    color: const Color(0xffffffff),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
