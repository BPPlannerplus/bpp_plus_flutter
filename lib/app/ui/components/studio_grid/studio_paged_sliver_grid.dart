import 'package:bpp_riverpod/app/model/shop/shop_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

Widget StudioPagedSliverGrid({
  required PagingController<int, ShopData> pageController,
  required PagedChildBuilderDelegate<ShopData> builderDelegate,
}) {
  return PagedSliverGrid(
    pagingController: pageController,
    showNewPageProgressIndicatorAsGridChild: false,
    showNewPageErrorIndicatorAsGridChild: false,
    showNoMoreItemsIndicatorAsGridChild: false,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisExtent: 188.h,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      childAspectRatio: 100 / 150,
    ),
    builderDelegate: builderDelegate,
  );
}
