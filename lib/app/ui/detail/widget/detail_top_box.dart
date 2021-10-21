import 'package:bpp_riverpod/app/provider/navigation_provider.dart';
import 'package:bpp_riverpod/app/routes/routes.dart';
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
          final index = ref.watch(detailPageProvider);
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              PageView(
                onPageChanged: (index) {
                  ref.read(detailPageProvider).state = index;
                },
                children: [
                  imageBox(
                    context: context,
                    img: profiles[0],
                    index: 0,
                  ),
                  imageBox(
                    context: context,
                    img: profiles[1],
                    index: 1,
                  ),
                  imageBox(
                    context: context,
                    img: profiles[2],
                    index: 2,
                  ),
                ],
              ),
              _circleStatus(index.state),
            ],
          );
        }),
      ),
    );
  }

  Widget imageBox({
    required BuildContext context,
    required String img,
    required int index,
  }) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.detailProfilePage,
          arguments: ProfileData(
            profiles: profiles,
            index: index,
          ),
        );
      },
      child: SizedBox.expand(
        child: Image.network(
          img,
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
