import 'dart:math';

import 'package:bpp_riverpod/app/model/concept/concept.dart';
import 'package:bpp_riverpod/app/provider/concept/concept_provier.dart';
import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ConceptDialog extends StatefulWidget {
  const ConceptDialog({Key? key, required this.concept}) : super(key: key);

  final Concept concept;

  @override
  _ConceptDialogState createState() => _ConceptDialogState();
}

class _ConceptDialogState extends State<ConceptDialog> {
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
      final c = ref.watch<Concept>(conceptListProvider.select((value) => value
          .concepts
          .where((element) => element.id == widget.concept.id)
          .toList()[0]));

      return Dialog(
        insetPadding: const EdgeInsets.all(1),
        child: Container(
          color: Colors.black,
          height: 387.h,
          width: 360.w,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Positioned.fill(
                child: Image.network(
                  widget.concept.profile,
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
                          argument: widget.concept.shop.id,
                        );
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 3),
                            child: Text(
                              widget.concept.shop.name,
                              style: BppTextStyle.dialogText,
                            ),
                          ),
                          const SizedBox(width: 5),
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
                            .setLike(widget.concept.id);
                        if (!c.like) {
                          _showToast();
                        }
                      },
                      child: Icon(
                        c.like
                            ? CupertinoIcons.heart_fill
                            : CupertinoIcons.heart,
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

  void _showToast() {
    fToast.showToast(
        child: Container(
          width: 173,
          height: 37,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(37.0),
            color: const Color(0xff595959),
          ),
          child: Center(
            child: Text(
              '찜 목록에 추가되었습니다!',
              style: BppTextStyle.smallText.copyWith(
                color: const Color(0xffffffff),
              ),
            ),
          ),
        ),
        toastDuration: const Duration(seconds: 1),
        positionedToastBuilder: (context, child) {
          return Positioned(
            top: 37,
            right: (MediaQuery.of(context).size.width - 173) / 2,
            child: child,
          );
        });
  }
}
