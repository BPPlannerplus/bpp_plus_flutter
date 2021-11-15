import 'dart:math';

import 'package:bpp_riverpod/app/model/concept/concept.dart';
import 'package:bpp_riverpod/app/provider/concept/concept_provier.dart';
import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget conceptDialog({required Concept concept}) {
  return Consumer(builder: (context, ref, _) {
    final navigator = ref.watch(navigatorProvider);
    final c = ref.watch<Concept>(conceptListProvider.select((value) => value
        .concepts
        .where((element) => element.id == concept.id)
        .toList()[0]));

    return Dialog(
      insetPadding: const EdgeInsets.all(1),
      // shape: const RoundedRectangleBorder(
      //   borderRadius: BorderRadius.all(
      //     Radius.circular(
      //       10.0,
      //     ),
      //   ),
      // ),
      child: Container(
        color: Colors.black,
        // decoration: const BoxDecoration(
        //   borderRadius: BorderRadius.all(
        //     Radius.circular(
        //       10.0,
        //     ),
        //   ),
        // ),
        height: 387.h,
        width: 360.w,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Positioned.fill(
              child: Image.network(
                concept.profile,
                fit: BoxFit.contain,
              ),
            ),
            Opacity(
              opacity: 0.5,
              child: Container(
                height: 40,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 2,
                bottom: 4,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      navigator.navigateTo(
                        routeName: AppRoutes.detailPage,
                        argument: concept.id,
                      );
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 3),
                          child: Text(
                            'Studio name',
                            style: BppTextStyle.dialogText,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Transform.rotate(
                          angle: pi,
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Color(0xffffffff),
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      ref
                          .read(conceptListProvider.notifier)
                          .setLike(concept.id);
                    },
                    child: Icon(
                      c.like ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                      color: c.like
                          ? const Color(0xffff5757)
                          : const Color(0xffffffff),
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  });
}
