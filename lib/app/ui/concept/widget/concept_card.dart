import 'package:bpp_riverpod/app/model/concept/concept.dart';
import 'package:bpp_riverpod/app/provider/concept/concept_provier.dart';
import 'package:bpp_riverpod/app/ui/components/toast/toast.dart';
import 'package:bpp_riverpod/app/ui/concept/widget/concept_dialog.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ConceptCard extends StatefulWidget {
  const ConceptCard({Key? key, required this.concept}) : super(key: key);

  final Concept concept;

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
    return Consumer(builder: (context, ref, _) {
      final navigator = ref.watch(navigatorProvider);

      return Stack(
        alignment: Alignment.bottomRight,
        children: [
          InkWell(
            onTap: () {
              showDialog(
                context: navigator.navigatorKey.currentContext!,
                barrierColor: const Color(0xdd000000),
                builder: (_) => ConceptDialog(concept: widget.concept),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                widget.concept.profile,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: InkWell(
              onTap: () {
                ref
                    .read(conceptListProvider.notifier)
                    .setLike(widget.concept.id);
                if (!widget.concept.like) {
                  showToast(fToast);
                }
              },
              child: Icon(
                widget.concept.like
                    ? CupertinoIcons.heart_fill
                    : CupertinoIcons.heart,
                color: widget.concept.like
                    ? const Color(0xffff5757)
                    : const Color(0xffffffff),
                size: 30,
              ),
            ),
          ),
        ],
      );
    });
  }
}
