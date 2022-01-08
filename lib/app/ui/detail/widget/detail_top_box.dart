import 'package:bpp_riverpod/app/provider/detail/detail_navigation_provider.dart';
import 'package:bpp_riverpod/app/routes/custom_arg/profile_arg.dart';
import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/ui/components/card/circle_status_card.dart';
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
                  _ImageBox(
                    img: profiles[0],
                    index: 0,
                    profiles: profiles,
                  ),
                  _ImageBox(
                    img: profiles[1],
                    index: 1,
                    profiles: profiles,
                  ),
                  _ImageBox(
                    img: profiles[2],
                    index: 2,
                    profiles: profiles,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: CircleStatusCard(
                  index: ref.watch(detailPageProvider),
                  selColor: BppColor.white,
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

class _ImageBox extends ConsumerWidget {
  const _ImageBox({
    Key? key,
    required this.img,
    required this.index,
    required this.profiles,
  }) : super(key: key);

  final String img;
  final int index;
  final List<String> profiles;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        ref.read(navigatorProvider).navigateTo(
              routeName: AppRoutes.detailProfilePage,
              argument: ProfileArg(
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
  }
}
