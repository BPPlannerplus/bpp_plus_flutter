import 'package:bpp_riverpod/app/provider/navigation_provider.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailProfilePage extends StatelessWidget {
  const DetailProfilePage({
    Key? key,
    required this.profiles,
    required this.index,
  }) : super(key: key);

  final List<String> profiles;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff232323),
        body: Consumer(builder: (context, ref, _) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 64,
                  bottom: 72,
                ),
                child: PageView(
                  controller: PageController(
                    initialPage: index,
                  ),
                  onPageChanged: (pageIndex) {
                    ref.read(detailPageProvider).state = pageIndex;
                    ref
                        .read(detailPageControllerProvider)
                        .jumpToPage(pageIndex);
                  },
                  children: [
                    _imgPage(0),
                    _imgPage(1),
                    _imgPage(2),
                  ],
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
              Container(
                padding: const EdgeInsets.only(bottom: 16),
                alignment: Alignment.bottomCenter,
                child: _circleStatus(ref.watch(detailPageProvider).state),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _imgPage(int index) {
    return SizedBox.expand(
      child: Hero(
        tag: 'profile$index',
        child: Image.network(
          profiles[index],
          height: 480.h,
        ),
      ),
    );
  }

  Widget _circleStatus(int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == 0 ? Colors.white : const Color(0xff656565),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == 1 ? Colors.white : const Color(0xff656565),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == 2 ? Colors.white : const Color(0xff656565),
            ),
          ),
        ],
      ),
    );
  }
}
