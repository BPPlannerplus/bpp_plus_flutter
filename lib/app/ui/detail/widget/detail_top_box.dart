import 'package:bpp_riverpod/app/provider/detail/detail_navigation_provider.dart';
import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailTopBox extends StatelessWidget {
  const DetailTopBox({
    Key? key,
    required this.profiles,
  }) : super(key: key);

  final List<String> profiles;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.black,
        height: 264,
        width: 360.w,
        child: Consumer(builder: (context, ref, _) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              PageView(
                controller: ref.watch(detailPageControllerProvider),
                onPageChanged: (index) {
                  ref.read(detailPageProvider.state).state = index;
                },
                children: [
                  imageBox(img: profiles[0], index: 0),
                  imageBox(img: profiles[1], index: 1),
                  imageBox(img: profiles[2], index: 2),
                ],
              ),
              _circleStatus(ref.watch(detailPageProvider)),
            ],
          );
        }),
      ),
    );
  }

  Widget imageBox({
    required String img,
    required int index,
  }) {
    return Consumer(builder: (context, ref, _) {
      return InkWell(
        onTap: () {
          ref.read(navigatorProvider).navigateTo(
                routeName: AppRoutes.detailProfilePage,
                argument: ProfileData(
                  profiles: profiles,
                  index: index,
                ),
              );
        },
        child: SizedBox.expand(
          child: Hero(
            tag: 'profile$index',
            child: Image.network(
              img,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    });
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
              color: index == 0 ? BppColor.white : const Color(0xff656565),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == 1 ? BppColor.white : const Color(0xff656565),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == 2 ? BppColor.white : const Color(0xff656565),
            ),
          ),
        ],
      ),
    );
  }
}
