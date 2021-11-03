import 'package:bpp_riverpod/app/model/concept.dart';
import 'package:bpp_riverpod/app/provider/concept/concept_provier.dart';
import 'package:bpp_riverpod/app/ui/concept/widget/concept_dialog.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget conceptCard({
  required Concept concept,
  // required ConceptState stateRead,
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
              return conceptDialog(
                concept: concept,
                // conceptState: stateRead,
              );
            },
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            concept.profile,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Consumer(builder: (context, ref, _) {
          final c = ref.watch(conceptProvider(concept));
          return InkWell(
            onTap: () {
              ref.read(conceptProvider(concept).notifier).setLike(concept.id);
            },
            child: Icon(
              c.like ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
              color: c.like ? const Color(0xffff5757) : const Color(0xffffffff),
              size: 30,
            ),
          );
        }),
      ),
    ],
  );
}
