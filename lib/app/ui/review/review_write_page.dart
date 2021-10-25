import 'dart:math';

import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:bpp_riverpod/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewWritePage extends StatelessWidget {
  const ReviewWritePage({Key? key}) : super(key: key);

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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '스튜디오',
                      style: BppTextStyle.smallText
                          .copyWith(color: const Color(0xff4d4d4d)),
                    ),
                    Row(
                      children: [
                        const Text(
                          '아날로그핏',
                          style: BppTextStyle.tabText,
                        ),
                        Transform.rotate(
                          angle: pi,
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Color(0xff000000),
                            size: 25,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 96,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '만족스러우셨나요?\n경험을 공유해주세요!',
                      style: BppTextStyle.tabText,
                    ),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 0,
                      glow: false,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Color(0xffffc142),
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 128,
                child: TextField(
                  maxLines: 8,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
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
