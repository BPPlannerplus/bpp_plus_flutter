import 'package:bpp_riverpod/app/provider/detail/detail_navigation_provider.dart';
import 'package:bpp_riverpod/app/provider/detail/shop_detail_page_controller.dart';
import 'package:bpp_riverpod/app/provider/detail/shop_detail_provider.dart';
import 'package:bpp_riverpod/app/repository/shop_repository.dart';
import 'package:bpp_riverpod/app/ui/components/dialog/bpp_alert_dialog.dart';
import 'package:bpp_riverpod/app/ui/components/state/custom_load_indicator.dart';
import 'package:bpp_riverpod/app/ui/components/state/error_card.dart';
import 'package:bpp_riverpod/app/ui/components/toast/toast.dart';
import 'package:bpp_riverpod/app/ui/detail/widget/detail_app_bar.dart';
import 'package:bpp_riverpod/app/ui/detail/widget/detail_bottom_bar.dart';
import 'package:bpp_riverpod/app/ui/detail/widget/detail_info_page.dart';
import 'package:bpp_riverpod/app/ui/detail/widget/detail_mid_box.dart';
import 'package:bpp_riverpod/app/ui/detail/widget/detail_portfolio_page.dart';
import 'package:bpp_riverpod/app/ui/detail/widget/detail_review_page.dart';
import 'package:bpp_riverpod/app/ui/detail/widget/detail_top_box.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends ConsumerStatefulWidget {
  const DetailPage({Key? key, required this.shopId}) : super(key: key);

  final int shopId;

  @override
  ConsumerState<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends ConsumerState<DetailPage> {
  final scrollController = ScrollController();
  final fToast = FToast();

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.offset.toInt() > 250) {
        ref.read(detailPageLeadingProvier.state).state = false;
      } else {
        ref.read(detailPageLeadingProvier.state).state = true;
      }
    });

    super.initState();
  }

  void scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(milliseconds: 300), curve: Curves.linear);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<int>(detailTabProvider, (pre, next) => scrollToTop());

    final index = ref.watch(detailTabProvider);
    final detailData = ref.watch(shopDetailProvider(widget.shopId));

    return SafeArea(
      child: detailData.when(
        loading: () => Scaffold(body: customLoadingIndicator()),
        error: (error, stack) => Scaffold(body: errorCard()),
        data: (shopData) {
          final shopDetailData = ref.watch(shopDetailStateProvider(shopData));
          final conceptPageController =
              ref.watch(shopDetailConceptPageControllerProvider(widget.shopId));

          final navigator = ref.watch(navigatorProvider);

          var _pages = [
            DetailPortfolioPage(pagingController: conceptPageController),
            DetailInfoPage(
              priceImg: shopData.priceImg,
              map: shopData.mapImg,
              partners: shopData.partnershipList!,
              address: shopData.address,
            ),
            DetailReviewPage(shopId: shopData.id),
          ];

          return WillPopScope(
            onWillPop: () => navigator.pop(result: shopDetailData.like),
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                leading: InkWell(
                  onTap: () => navigator.pop(result: shopDetailData.like),
                  child: SvgPicture.asset(
                    'assets/icon/ic_back.svg',
                    color: ref.watch(detailPageLeadingProvier)
                        ? BppColor.white
                        : BppColor.black,
                  ),
                ),
                toolbarHeight: 40,
              ),
              extendBodyBehindAppBar: true,
              body: CustomScrollView(
                controller: scrollController,
                slivers: [
                  DetailTopBox(
                    profiles: shopData.profiles,
                  ),
                  DetailMidBox(
                    logo: shopData.logo,
                    price: shopData.minPrice,
                    shopName: shopData.name,
                  ),
                  const DetailAppBar(),
                  SliverPadding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      right: 16,
                      left: 16,
                    ),
                    sliver: _pages[index],
                  ),
                ],
              ),
              bottomNavigationBar: DetailBottomBar(
                onTabIcon: () async {
                  if (!shopDetailData.like) {
                    showToast(fToast);
                  }
                  ref
                      .read(shopDetailStateProvider(shopData).notifier)
                      .setLike();
                  await ref
                      .read(shopRepositroyProvider)
                      .setLike(shopDetailData.id, !shopDetailData.like);
                },
                onTabButton: () async {
                  try {
                    await ref
                        .read(shopDetailStateProvider(shopData).notifier)
                        .createReservation(shopData.id);
                    await launch(shopData.kakaoUrl);
                  } catch (e) {
                    showDialog(
                      context: context,
                      builder: (context) => bppAlertDialog(
                        title: '이미 예약된 스튜디오입니다!',
                        confirm: () {},
                      ),
                    );
                  }
                },
                isLike: shopDetailData.like,
              ),
            ),
          );
        },
      ),
    );
  }
}
