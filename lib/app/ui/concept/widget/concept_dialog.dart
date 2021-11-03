import 'dart:math';

import 'package:bpp_riverpod/app/model/concept.dart';
import 'package:bpp_riverpod/app/provider/concept/concept_provier.dart';
import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget conceptDialog({
  required Concept concept,
  // required ConceptState conceptState,
}) {
  return Dialog(
    insetPadding: const EdgeInsets.all(1),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(
          10.0,
        ),
      ),
    ),
    child: Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(
          Radius.circular(
            10.0,
          ),
        ),
      ),
      height: 387.h,
      width: 360.w,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Positioned.fill(
            child: Image.network(
              concept.profile,
              fit: BoxFit.fill,
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
                    locator<NavigationService>().navigateTo(
                      routeName: AppRoutes.detailPage,
                      argument: concept.id,
                    );
                  },
                  child: Row(
                    children: [
                      Text(
                        'Studio name',
                        style: BppTextStyle.dialogText,
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
                Consumer(builder: (context, ref, _) {
                  final c = ref.watch(conceptProvider(concept));

                  return InkWell(
                    onTap: () {
                      ref
                          .read(conceptProvider(concept).notifier)
                          .setLike(concept.id);
                    },
                    child: Icon(
                      c.like ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                      color: c.like
                          ? const Color(0xffff5757)
                          : const Color(0xffffffff),
                      size: 30,
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
