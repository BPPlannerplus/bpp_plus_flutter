import 'package:bpp_riverpod/app/provider/concept_filter_provider.dart';
import 'package:bpp_riverpod/app/ui/concept/widget/concept_botton_sheet.dart';
import 'package:bpp_riverpod/app/ui/concept/widget/concept_filter_card.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConceptAppBar extends StatelessWidget {
  const ConceptAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 32,
      ),
      color: Colors.white,
      height: 155,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                child: Text(
                  '원하는 컨셉의\n스튜디오를 찾아보세요',
                  style: BppTextStyle.screenText,
                ),
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    context: context,
                    isScrollControlled: true,
                    builder: (_) {
                      return conceptBottomSheet();
                    },
                  );
                },
                child: Container(
                  height: 40,
                  width: 40,
                  color: Colors.white,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey.shade100,
                    child: const Icon(
                      CupertinoIcons.layers_alt_fill,
                      size: 25,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 22,
          ),
          Expanded(
            child: Container(
              height: 1,
              decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey))),
            ),
          ),
          Container(
            height: 40,
            width: double.infinity,
            color: Colors.white,
            child: Consumer(builder: (context, ref, _) {
              return ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...filterCards(ref.watch(conceptFilter).state.headNum),
                  ...filterCards(ref.watch(conceptFilter).state.gender),
                  ...filterCards(ref.watch(conceptFilter).state.background),
                  ...filterCards(ref.watch(conceptFilter).state.prop),
                  ...filterCards(ref.watch(conceptFilter).state.cloth),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
