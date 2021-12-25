import 'package:bpp_riverpod/app/provider/navigation/bottom_bar_provider.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_filter_provider.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_page_controller_provider.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_paging_state_provider.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/theme/color.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeBottomSheet extends ConsumerWidget {
  const HomeBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(shopFilterProvider);
    final navigator = ref.watch(navigatorProvider);
    return Container(
        padding: const EdgeInsets.only(
          top: 16,
          right: 16,
          left: 16,
          bottom: 34,
        ),
        height: 240,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('스튜디오 지역 선택', style: BppTextStyle.defaultText),
                  const SizedBox(height: 16),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    runSpacing: 8,
                    children: [
                      for (var i = 0; i < filter.length; i++)
                        InkWell(
                          onTap: () {
                            ref
                                .read(shopFilterStateProvider)
                                .toggleFilterState(i);
                          },
                          child: _ToggleIcon(
                            text: filter[i].id,
                            isCheck: filter[i].check,
                          ),
                        )
                    ],
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    ref.read(shopPagingStateProvider).reset();
                    ref.read(shopPageControllerProvider).refresh();
                    ref.read(isShowBottomBarStateProvider.state).state = true;
                    navigator.pop();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(BppColor.main),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    elevation: MaterialStateProperty.all(0),
                  ),
                  child: SizedBox(
                      height: 48,
                      child: Center(
                          child: Text('선택완료',
                              style: BppTextStyle.tabText
                                  .copyWith(color: BppColor.white)))))
            ]));
  }
}

class _ToggleIcon extends StatelessWidget {
  const _ToggleIcon({
    Key? key,
    required this.text,
    required this.isCheck,
  }) : super(key: key);

  final String text;
  final bool isCheck;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Container(
            width: 76,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: isCheck ? BppColor.main : BppColor.unSelButton,
            ),
            child: Center(
                child: Text(text,
                    style: BppTextStyle.smallText.copyWith(
                        color: isCheck ? BppColor.white : BppColor.unSelText,
                        fontWeight: isCheck ? FontWeight.w600 : null,
                        fontSize: 14)))));
  }
}
