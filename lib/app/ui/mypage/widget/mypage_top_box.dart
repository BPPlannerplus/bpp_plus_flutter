import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MypageTopBox extends StatelessWidget {
  const MypageTopBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userInfo = Hive.box('auth').get('userInfo');

    return SliverToBoxAdapter(
      child: Container(
        height: 145,
        padding: const EdgeInsets.only(top: 72),
        color: const Color(0xffffffff),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: const Color(0xffffffff),
                  height: 56,
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Text(
                      '${userInfo.userName}님\n환영합니다!',
                      style: BppTextStyle.screenText
                          .copyWith(fontWeight: FontWeight.w600, height: 1.3),
                    ),
                  ),
                ),
                Consumer(builder: (context, ref, _) {
                  return InkWell(
                    onTap: () {
                      ref
                          .read(navigatorProvider)
                          .navigateTo(routeName: AppRoutes.settingPage);
                    },
                    child: SvgPicture.asset('assets/icon/ic_setting.svg'),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
