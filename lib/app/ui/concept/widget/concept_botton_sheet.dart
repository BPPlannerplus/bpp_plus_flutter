import 'package:bpp_riverpod/app/provider/concept_filter_provider.dart';
import 'package:bpp_riverpod/app/provider/concept_provier.dart';
import 'package:bpp_riverpod/app/ui/concept/widget/concept_bts_icon.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

conceptBottomSheet() {
  return Consumer(builder: (context, ref, _) {
    return Container(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      height: 530,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '컨셉필터',
                style: BppTextStyle.defaultText,
              ),
              InkWell(
                onTap: () {
                  ref
                      .read(conceptFilterCheckProvider.notifier)
                      .refreshFilterState();
                },
                child: const Icon(
                  CupertinoIcons.add,
                  size: 30,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          filterColumn('인원', 0),
          filterColumn('성별', 1),
          filterColumn('배경', 2),
          filterColumn('소품', 3),
          filterColumn('의상', 4),
          ElevatedButton(
            onPressed: () {
              ref.read(conceptFilter).state =
                  ref.read(conceptFilterCheckProvider.notifier).makeFilter();
              ref.read(conceptReqFilter).state =
                  ref.read(conceptFilterCheckProvider.notifier).makeReqFilter();
              ref.read(conceptListProvider.notifier).reset();
              Navigator.pop(context);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                const Color(0xff3B75FF),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            child: SizedBox(
              height: 48,
              child: Center(
                child: Text(
                  '선택완료',
                  style: BppTextStyle.tabText
                      .copyWith(color: const Color(0xffffffff)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  });
}