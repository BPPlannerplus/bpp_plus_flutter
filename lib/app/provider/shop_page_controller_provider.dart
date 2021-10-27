import 'package:bpp_riverpod/app/model/shop_data.dart';
import 'package:bpp_riverpod/app/provider/studio_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

final studioPageControllerProvider =
    Provider<PagingController<int, ShopData>>((ref) {
  final _pagingController = PagingController<int, ShopData>(
    firstPageKey: 0,
  );

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await ref.read(studioListProvider.notifier).getData();
      final isLastPage = newItems.shopDatas.length < 20;

      if (isLastPage) {
        _pagingController.appendLastPage(newItems.shopDatas);
      } else {
        final nextPageKey = pageKey + newItems.shopDatas.length;
        _pagingController.appendPage(newItems.shopDatas, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  _pagingController.addPageRequestListener((pageKey) {
    _fetchPage(pageKey);
  });
  return _pagingController;
});
