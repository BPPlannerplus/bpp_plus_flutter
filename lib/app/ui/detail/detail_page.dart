import 'package:bpp_riverpod/app/provider/navigation_provider.dart';
import 'package:bpp_riverpod/app/provider/detail/shop_detail_provider.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_page_controller_provider.dart';
import 'package:bpp_riverpod/app/ui/detail/widget/detail_app_bar.dart';
import 'package:bpp_riverpod/app/ui/detail/widget/detail_info_page.dart';
import 'package:bpp_riverpod/app/ui/detail/widget/detail_mid_box.dart';
import 'package:bpp_riverpod/app/ui/detail/widget/detail_portfolio_page.dart';
import 'package:bpp_riverpod/app/ui/detail/widget/detail_review_page.dart';
import 'package:bpp_riverpod/app/ui/detail/widget/detail_top_box.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    scrollController.animateTo(
      // 345,
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
        loading: () => const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        error: (error, stack) => Scaffold(
          body: Center(
            child: Text(
              error.toString(),
              style: const TextStyle(
                fontSize: 32,
              ),
            ),
          ),
        ),
        data: (shopData) {
          final shopDetailData = ref.watch(shopDetailStateProvider(shopData));
          final conceptPageController =
              ref.watch(shopDetailConceptPageControllerProvider(widget.shopId));
          final reviewPageController =
              ref.watch(shopDetailReviewPageControllerProvider(widget.shopId));

          var _pages = [
            DetailPortfolioPage(
              pagingController: conceptPageController,
            ),
            DetailInfoPage(
              priceImg: shopData.priceImg,
              map: shopData.mapImg,
              partners: shopData.partnershipList,
              address: shopData.address,
            ),
            DetailReviewPage(
              pagingController: reviewPageController,
            ),
          ];

          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0x00000000),
              leading: InkWell(
                onTap: () {
                  locator<NavigationService>().pop();
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
                  price: shopData.minPrice,
                  shopName: shopData.name,
                ),
                const DetailAppBar(),
                SliverPadding(
                  padding: const EdgeInsets.only(top: 8, right: 16, left: 16),
                  sliver: _pages[index],
                ),
              ],
            ),
            bottomNavigationBar: Container(
              padding: const EdgeInsets.only(right: 16, left: 16),
              height: 68,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      ref
                          .read(shopDetailStateProvider(shopData).notifier)
                          .setLike();
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xffe6e6e6),
                          ),
                        ),
                        Positioned(
                          top: 1,
                          left: 1,
                          child: Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Icon(
                              shopDetailData.like
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 44,
                    width: 272.w,
                    child: ElevatedButton(
                      onPressed: () async {
                        await launch(shopData.kakaoUrl);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF3b75ff),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '예약 및 문의하기',
                          style: BppTextStyle.defaultText.copyWith(
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
