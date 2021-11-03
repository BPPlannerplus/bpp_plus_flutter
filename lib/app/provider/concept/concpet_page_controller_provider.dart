import 'package:bpp_riverpod/app/model/concept/concept.dart';
import 'package:bpp_riverpod/app/provider/concept/concept_provier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

final conceptPageControllerProvider =
    Provider<PagingController<int, Concept>>((ref) {
  final _pagingController = PagingController<int, Concept>(
    firstPageKey: 0,
  );

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await ref.read(conceptListProvider.notifier).getData();
      final isLastPage = newItems.concepts.length < 20;

      if (isLastPage) {
        _pagingController.appendLastPage(newItems.concepts);
      } else {
        final nextPageKey = pageKey + newItems.concepts.length;
        _pagingController.appendPage(newItems.concepts, nextPageKey);
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
