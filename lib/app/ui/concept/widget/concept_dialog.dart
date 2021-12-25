import 'dart:math';

import 'package:bpp_riverpod/app/model/concept/concept.dart';
import 'package:bpp_riverpod/app/provider/concept/concept_provier.dart';
import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/ui/components/card/cached_image_card.dart';
import 'package:bpp_riverpod/app/ui/components/toast/toast.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/theme/color.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ConceptDialog extends StatelessWidget {
  ConceptDialog({Key? key, required this.concept, required this.index})
      : super(key: key);

  final Concept concept;
  final int index;
  final fToast = FToast();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(0),
      child: Container(
        color: Colors.black,
        height: 387.h,
        width: 360.w,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Positioned.fill(
                child: CachedImageCard(
                    imageUrl: concept.profile,
                    height: double.infinity,
                    width: double.infinity)),
            Opacity(
                opacity: 0.5, child: Container(height: 40, color: Colors.grey)),
            Padding(
              padding:
                  const EdgeInsets.only(left: 16, right: 16, top: 2, bottom: 4),
              child: Consumer(builder: (context, ref, _) {
                final navigator = ref.watch(navigatorProvider);
                final concepts = ref.watch(conceptListProvider).concepts;

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        navigator.navigateTo(
                          routeName: AppRoutes.detailPage,
                          argument: concept.shop.id,
                        );
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 3),
                            child: Text(concept.shop.name,
                                style: BppTextStyle.dialogText),
                          ),
                          const SizedBox(width: 5),
                          Transform.rotate(
                            angle: pi,
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              color: BppColor.white,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (!concepts[index].like) {
                          showToast(fToast);
                        }
                        ref
                            .read(conceptListProvider.notifier)
                            .setLike(concept.id, !concepts[index].like);
                      },
                      child: Icon(
                        concepts[index].like
                            ? CupertinoIcons.heart_fill
                            : CupertinoIcons.heart,
                        color: concepts[index].like
                            ? BppColor.like
                            : BppColor.white,
                        size: 30,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
