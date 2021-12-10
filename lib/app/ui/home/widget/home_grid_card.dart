import 'package:bpp_riverpod/app/model/shop/shop_data.dart';
import 'package:bpp_riverpod/app/provider/shop/shop_state.dart';
import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/util/enum.dart';
import 'package:bpp_riverpod/app/util/format.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:bpp_riverpod/app/util/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeGridCard extends StatefulWidget {
  const HomeGridCard({
    Key? key,
    required this.shop,
    required this.shopState,
  }) : super(key: key);

  final ShopData shop;
  final ShopListState shopState;

  @override
  _HomeGridCardState createState() => _HomeGridCardState();
}

class _HomeGridCardState extends State<HomeGridCard> {
  final fToast = FToast();

  @override
  void initState() {
    super.initState();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 112,
          width: 160.w,
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Consumer(builder: (context, ref, _) {
                final navigator = ref.watch(navigatorProvider);
                return InkWell(
                  onTap: () {
                    navigator.navigateTo(
                      routeName: AppRoutes.detailPage,
                      argument: widget.shop.id,
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      widget.shop.profile,
                      height: 112,
                      width: 160.w,
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              }),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: InkWell(
                  onTap: () {
                    widget.shopState.setLike(widget.shop.id, widget.shop.like);
                    if (!widget.shop.like) {
                      _showToast();
                    }
                  },
                  child: Icon(
                    widget.shop.like
                        ? CupertinoIcons.heart_fill
                        : CupertinoIcons.heart,
                    color: widget.shop.like
                        ? const Color(0xffff5757)
                        : const Color(0xffffffff),
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          widget.shop.name,
          style: !BppTextStyle.isEng(widget.shop.name)
              ? BppTextStyle.tabText
              : BppTextStyle.engShopNameText,
        ),
        const SizedBox(height: 2),
        Text(
          shopAddrToKR[widget.shop.address]!,
          style: BppTextStyle.smallText,
        ),
        const SizedBox(height: 2),
        widget.shop.minPrice != null
            ? Text(
                priceFormat(widget.shop.minPrice!),
                style: BppTextStyle.smallText,
              )
            : const Text(
                '가격 정보 없음',
                style: BppTextStyle.smallText,
              ),
      ],
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
