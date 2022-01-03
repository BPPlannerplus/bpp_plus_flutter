import 'package:bpp_riverpod/app/provider/navigation_provider.dart';
import 'package:bpp_riverpod/app/util/theme/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InfoText extends ConsumerWidget {
  const InfoText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visible = ref.watch(inquiryInfoTextShowProvier);
    return visible
        ? Stack(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: const Color(0xfff8f8f8),
                ),
                width: double.infinity,
                height: 77,
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '확정된 예약날짜를 입력하시면\n예약일정에서 한 눈에 일정을 확인할 수 있습니다.\n(입력된 예약날짜는 가맹점과 연계되는 정보는 아닙니다)',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                      color: BppColor.unSelText,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: InkWell(
                  onTap: () {
                    ref.read(inquiryInfoTextShowProvier.state).state = false;
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
  }
}
