import 'package:bpp_riverpod/app/provider/detail/detail_navigation_provider.dart';
import 'package:bpp_riverpod/app/provider/detail/shop_detail_page_controller.dart';
import 'package:bpp_riverpod/app/provider/detail/shop_detail_provider.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_provider.dart';
import 'package:bpp_riverpod/app/ui/detail/widget/detail_app_bar.dart';
import 'package:bpp_riverpod/app/ui/detail/widget/detail_bottom_bar.dart';
import 'package:bpp_riverpod/app/ui/detail/widget/detail_info_page.dart';
import 'package:bpp_riverpod/app/ui/detail/widget/detail_mid_box.dart';
import 'package:bpp_riverpod/app/ui/detail/widget/detail_portfolio_page.dart';
import 'package:bpp_riverpod/app/ui/detail/widget/detail_review_page.dart';
import 'package:bpp_riverpod/app/ui/detail/widget/detail_top_box.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:bpp_riverpod/app/util/widget/custom_load_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends ConsumerStatefulWidget {
  const DetailPage({
    Key? key,
    required this.shopId,
  }) : super(key: key);

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
    fToast.init(context);

    super.initState();
  }

  void scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<int>(detailTabProvider, (pre, next) {
      scrollToTop();
    });

    final index = ref.watch(detailTabProvider);
    final detailData = ref.watch(shopDetailProvider(widget.shopId));

    return SafeArea(
      child: detailData.when(
        loading: () => Scaffold(
          body: customLoadingIndicator(),
        ),
        error: (error, stack) => Scaffold(
            body: Center(
                child: Text(error.toString(),
                    style: const TextStyle(fontSize: 24)))),
        data: (shopData) {
          final shopDetailData = ref.watch(shopDetailStateProvider(shopData));
          final conceptPageController =
              ref.watch(shopDetailConceptPageControllerProvider(widget.shopId));
          final reviewPageController =
              ref.watch(shopDetailReviewPageControllerProvider(widget.shopId));

          final navigator = ref.watch(navigatorProvider);

          var _pages = [
            DetailPortfolioPage(pagingController: conceptPageController),
            DetailInfoPage(
              priceImg: shopData.priceImg!,
              map: shopData.mapImg,
              partners: shopData.partnershipList!,
              address: shopData.address,
            ),
            DetailReviewPage(
              pagingController: reviewPageController,
              shopId: shopData.id,
            ),
          ];

          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0x00000000),
              leading: InkWell(
                onTap: () {
                  navigator.pop();
                },
                child: SvgPicture.asset(
                  'assets/icon/ic_back.svg',
                  color: ref.watch(detailPageLeadingProvier)
                      ? const Color(0xffffffff)
                      : const Color(0xff000000),
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
                  price: shopData.minPrice ?? 123123,
                  shopName: shopData.name,
                ),
                const DetailAppBar(),
                SliverPadding(
                  padding: const EdgeInsets.only(top: 8, right: 16, left: 16),
                  sliver: _pages[index],
                ),
              ],
            ),
            bottomNavigationBar: detailBottomBar(
              onTabIcon: () async {
                if (!shopDetailData.like) {
                  _showToast();
                }
                await ref
                    .read(shopListProvider)
                    .setLike(shopData.id, shopDetailData.like);
                ref.read(shopDetailStateProvider(shopData).notifier).setLike();
              },
              onTabButton: () async {
                await ref
                    .read(shopDetailStateProvider(shopData).notifier)
                    .createReservation(shopData.id);
                await launch(shopData.kakaoUrl);
              },
              isLike: shopDetailData.like,
            ),
          );
        },
      ),
    );
  }

  void _showToast() {
    fToast.removeQueuedCustomToasts();
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
        // gravity: ToastGravity.TOP,
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
