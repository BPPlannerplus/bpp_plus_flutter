import 'package:bpp_riverpod/app/provider/navigation_provider.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';

class InquiryPage extends StatelessWidget {
  const InquiryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return emptyBox();
    return inquiryList(context);
  }

  Widget inquiryList(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          infoText(),
          titleRow(),
          inquiryCard(context),
          inquiryCard(context),
        ],
      ),
    );
  }

  Widget infoText() {
    return Consumer(builder: (context, ref, _) {
      final visible = ref.watch(inquiryInfoTextShowProvier).state;
      return visible
          ? Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  'assets/image/inquiry_text_background.svg',
                  width: 328.w,
                  height: 77.h,
                ),
                SvgPicture.asset(
                  'assets/image/inquiry_text.svg',
                  height: 45.h,
                ),
                Positioned(
                  top: 10,
                  right: 5,
                  child: InkWell(
                    onTap: () {
                      ref.read(inquiryInfoTextShowProvier).state = false;
                    },
                    child: const Icon(
                      CupertinoIcons.xmark,
                      size: 20,
                    ),
                  ),
                ),
              ],
            )
          : const SizedBox();
    });
  }

  Widget titleRow() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            '문의중 업체 2',
            style: BppTextStyle.smallText,
          ),
          Text(
            '전체 삭제',
            style: BppTextStyle.filterText,
          ),
        ],
      ),
    );
  }

  Widget inquiryCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, bottom: 12),
      height: 107,
      width: 327,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: const Color(0xfff2f2f2),
            width: 1.0.h,
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            radius: 32,
            backgroundImage: NetworkImage(
              'https://png.pngtree.com/png-clipart/20200727/original/pngtree-photography-studio-logo-template-png-image_5392695.jpg',
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '스튜디오',
                style: BppTextStyle.defaultText,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Vanguard',
                style: BppTextStyle.tabText.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  right: 5,
                ),
                child: Icon(
                  CupertinoIcons.xmark,
                  size: 20,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: Container(
                          width: 296.w,
                          height: 225.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            children: [
                              Text('예약일정'),
                              DateTimePickerWidget(
                                minDateTime: DateTime(2000),
                                maxDateTime: DateTime(2100),
                                locale: DateTimePickerLocale.ko,
                                initDateTime: DateTime.now(),
                                dateFormat: 'yyyy-MM-dd',
                                pickerTheme: DateTimePickerTheme(
                                  showTitle: false,
                                  pickerHeight: 105,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: SizedBox(
                  height: 33,
                  width: 100,
                  child: Center(
                    child: Text(
                      '일정입력',
                      style: BppTextStyle.smallText.copyWith(
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget emptyBox() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(top: 70.h),
        child: Center(
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/image/inquiry_none.svg',
                width: 221.w,
                height: 154.h,
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  '스튜디오 보러가기',
                  style: BppTextStyle.defaultText.copyWith(
                    color: const Color(0xffffffff),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   SizedBox(
//                                     height: 108,
//                                     width: 68,
//                                     child: CupertinoPicker(
//                                       onSelectedItemChanged: (value) {},
//                                       itemExtent: 23,
//                                       squeeze: 2.0,
//                                       children: const [
//                                         Text("Text 1"),
//                                         Text("Text 1"),
//                                         Text("Text 1"),
//                                         Text("Text 1"),
//                                         Text("Text 1"),
//                                         Text("Text 1"),
//                                       ],
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 68,
//                                     width: 50,
//                                     child: CupertinoPicker(
//                                       onSelectedItemChanged: (value) {},
//                                       itemExtent: 23,
//                                       squeeze: 1.0,
//                                       children: const [
//                                         Text("Text 1"),
//                                         Text("Text 1"),
//                                         Text("Text 1"),
//                                         Text("Text 1"),
//                                         Text("Text 1"),
//                                         Text("Text 1"),
//                                       ],
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 68,
//                                     width: 50,
//                                     child: CupertinoPicker(
//                                       onSelectedItemChanged: (value) {},
//                                       itemExtent: 23,
//                                       squeeze: 0.5,
//                                       children: const [
//                                         Text("Text 1"),
//                                         Text("Text 1"),
//                                         Text("Text 1"),
//                                         Text("Text 1"),
//                                         Text("Text 1"),
//                                         Text("Text 1"),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
