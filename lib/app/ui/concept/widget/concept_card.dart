import 'package:bpp_riverpod/app/provider/concept_provier.dart';
import 'package:bpp_riverpod/app/ui/concept/widget/concept_dialog.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget conceptCard({
  required int index,
  required String profie,
  required bool like,
  required ConceptListState stateRead,
}) {
  return Stack(
    alignment: Alignment.bottomRight,
    children: [
      // Container(
      //   height: 144,
      //   width: 104.w,
      //   color: Colors.black,
      // ),
      InkWell(
        onTap: () {
          showDialog(
            context: locator<NavigationService>().navigatorKey.currentContext!,
            barrierColor: const Color(0xdd000000),
            builder: (_) {
              return conceptDialog(index);
            },
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            profie,
            height: 144,
            fit: BoxFit.fill,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: InkWell(
          onTap: () {
            stateRead.setConceptLike(index);
          },
          child: Icon(
            like ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
            color: like ? const Color(0xffff5757) : const Color(0xffffffff),
            size: 30,
          ),
        ),
      ),
    ],
  );
}
