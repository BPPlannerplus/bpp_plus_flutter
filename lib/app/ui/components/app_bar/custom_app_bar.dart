import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

AppBar customAppBar(String title) {
  return AppBar(
    centerTitle: true,
    title: Text(title, style: BppTextStyle.defaultText),
    leading: Consumer(builder: (context, ref, _) {
      final navigator = ref.watch(navigatorProvider);
      return InkWell(
        onTap: () => navigator.pop(),
        child: SvgPicture.asset('assets/icon/ic_back.svg'),
      );
    }),
    toolbarHeight: 48,
  );
}
