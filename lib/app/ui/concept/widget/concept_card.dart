import 'package:bpp_riverpod/app/model/concept.dart';
import 'package:bpp_riverpod/app/provider/concept/concept_provier.dart';
import 'package:bpp_riverpod/app/ui/concept/widget/concept_dialog.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget conceptCard({
  required Concept concept,
  required ConceptState stateRead,
}) {
  return Stack(
    alignment: Alignment.bottomRight,
    children: [
      InkWell(
        onTap: () {
          showDialog(
            context: locator<NavigationService>().navigatorKey.currentContext!,
            barrierColor: const Color(0xdd000000),
            builder: (_) {
              return conceptDialog(concept);
            },
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            concept.profile,
            height: 144,
            fit: BoxFit.fill,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: InkWell(
          onTap: () {
            stateRead.setLike(concept.id);
          },
          child: Icon(
            concept.like ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
            color: concept.like
                ? const Color(0xffff5757)
                : const Color(0xffffffff),
            size: 30,
          ),
        ),
      ),
    ],
  );
}
