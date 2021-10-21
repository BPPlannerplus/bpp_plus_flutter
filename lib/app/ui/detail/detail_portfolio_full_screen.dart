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
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const SizedBox(
                  width: 40,
                  height: 40,
                  child: Icon(
                    Icons.cancel,
                    color: Colors.white,
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
