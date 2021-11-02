import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailPortfolioFullScreen extends StatelessWidget {
  const DetailPortfolioFullScreen({
    Key? key,
    required this.profile,
  }) : super(key: key);

  final String profile;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff232323),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 64,
                bottom: 72,
              ),
              child: Image.network(
                profile,
                height: 480.h,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: InkWell(
                onTap: () {
                  locator<NavigationService>().pop();
                },
                child: const SizedBox(
                  width: 40,
                  height: 40,
                  child: Icon(
                    CupertinoIcons.xmark,
                    color: Color(0xffffffff),
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
