import 'package:bpp_riverpod/app/provider/detail/detail_navigation_provider.dart';
import 'package:bpp_riverpod/app/ui/components/card/circle_status_card.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/theme/color.dart';
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
                    ref.read(detailPageProvider.state).state = pageIndex;
                    ref
                        .read(detailPageControllerProvider)
                        .jumpToPage(pageIndex);
                  },
                  children: [
                    _ImgPage(
                      index: 0,
                      profile: profiles[0],
                    ),
                    _ImgPage(
                      index: 1,
                      profile: profiles[1],
                    ),
                    _ImgPage(
                      index: 2,
                      profile: profiles[2],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 16,
                right: 16,
                child: Consumer(builder: (context, ref, _) {
                  final navigator = ref.watch(navigatorProvider);
                  return InkWell(
                    onTap: () {
                      navigator.pop();
                    },
                    child: const Icon(
                      CupertinoIcons.xmark,
                      color: BppColor.white,
                      size: 30,
                    ),
                  );
                }),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 16),
                alignment: Alignment.bottomCenter,
                child: CircleStatusCard(
                  index: ref.watch(detailPageProvider),
                  selColor: Colors.white,
                  unSelColor: const Color(0xff656565),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class _ImgPage extends StatelessWidget {
  const _ImgPage({
    Key? key,
    required this.index,
    required this.profile,
  }) : super(key: key);

  final int index;
  final String profile;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Hero(
        tag: 'profile$index',
        child: Image.network(
          profile,
          height: 480.h,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
