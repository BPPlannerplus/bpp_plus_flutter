import 'package:bpp_riverpod/app/provider/navigation_provider.dart';
import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/ui/components/card/circle_status_card.dart';
import 'package:bpp_riverpod/app/ui/onboarding/widget/first_onboarding_card.dart';
import 'package:bpp_riverpod/app/ui/onboarding/widget/second_onboarding_card.dart';
import 'package:bpp_riverpod/app/ui/onboarding/widget/third_onboarding_card.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/theme/color.dart';
import 'package:bpp_riverpod/app/util/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnBoardingPage extends ConsumerWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  final _pages = const [
    FirstOnboardingCard(),
    SecondOnboardingCard(),
    ThirdOnboardingCard(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = ref.watch(onboardingPageProvider);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 56, bottom: 56),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 32),
                  child: Consumer(builder: (context, ref, _) {
                    final navigator = ref.watch(navigatorProvider);
                    return InkWell(
                      onTap: () {
                        navigator.navigateTo(routeName: AppRoutes.loginPage);
                      },
                      child: Text(
                        'Skip',
                        style: BppTextStyle.smallText.copyWith(
                          color:
                              pageIndex != 2 ? BppColor.main : BppColor.white,
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: PageView(
                  onPageChanged: (index) {
                    ref.read(onboardingPageProvider.state).state = index;
                  },
                  children: _pages,
                ),
              ),
              pageIndex == 2
                  ? const _StartButton()
                  : CircleStatusCard(
                      index: pageIndex,
                      selColor: BppColor.unSelText,
                      unSelColor: BppColor.borderColor,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StartButton extends ConsumerWidget {
  const _StartButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigator = ref.watch(navigatorProvider);
    return SizedBox(
      height: 48,
      width: 244,
      child: ElevatedButton(
        onPressed: () {
          navigator.navigateTo(routeName: AppRoutes.loginPage);
        },
        style: ElevatedButton.styleFrom(
          primary: BppColor.main,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(39),
          ),
        ),
        child: Text(
          '????????????',
          style: BppTextStyle.tabText.copyWith(color: BppColor.white),
        ),
      ),
    );
  }
}
