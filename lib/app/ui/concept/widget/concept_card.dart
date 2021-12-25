import 'package:bpp_riverpod/app/model/concept/concept.dart';
import 'package:bpp_riverpod/app/provider/concept/concept_provier.dart';
import 'package:bpp_riverpod/app/ui/components/card/cached_image_card.dart';
import 'package:bpp_riverpod/app/ui/components/toast/toast.dart';
import 'package:bpp_riverpod/app/ui/concept/widget/concept_dialog.dart';
import 'package:bpp_riverpod/app/util/theme/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ConceptCard extends StatefulWidget {
  const ConceptCard({Key? key, required this.concept, required this.index})
      : super(key: key);

  final Concept concept;
  final int index;

  @override
  _ConceptCardState createState() => _ConceptCardState();
}

class _ConceptCardState extends State<ConceptCard> {
  final fToast = FToast();

  @override
  void initState() {
    super.initState();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              barrierColor: const Color(0xdd000000),
              builder: (_) =>
                  ConceptDialog(concept: widget.concept, index: widget.index),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedImageCard(
              imageUrl: widget.concept.profile,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Consumer(builder: (context, ref, _) {
            return InkWell(
              onTap: () {
                if (!widget.concept.like) {
                  showToast(fToast);
                }
                ref
                    .read(conceptListProvider.notifier)
                    .setLike(widget.concept.id, !widget.concept.like);
              },
              child: Icon(
                widget.concept.like
                    ? CupertinoIcons.heart_fill
                    : CupertinoIcons.heart,
                color: widget.concept.like ? BppColor.like : BppColor.white,
                size: 30,
              ),
            );
          }),
        ),
      ],
    );
  }
}
