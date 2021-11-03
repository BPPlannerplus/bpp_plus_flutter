import 'package:bpp_riverpod/app/model/concept/concept.dart';
import 'package:bpp_riverpod/app/provider/concept/concept_provier.dart';
import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ConceptWishGrid extends ConsumerStatefulWidget {
  const ConceptWishGrid({Key? key}) : super(key: key);

  @override
  ConsumerState<ConceptWishGrid> createState() => _ConceptWishGridState();
}

class _ConceptWishGridState extends ConsumerState<ConceptWishGrid> {
  final int _pageSize = 30;

  final PagingController<int, Concept> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final newItems = List.generate(
          30,
          (index) => Concept(
              id: index,
              profile:
                  'https://www.sciencetimes.co.kr/wp-content/uploads/2021/08/1-%EC%A4%84%EB%A6%AC%EC%97%94%EA%B0%95-%EC%9D%B8%EC%8A%A4%ED%83%80%EA%B7%B8%EB%9E%A8-384x480.jpg',
              shop: IdNamePair(id: index, name: 'Concept $index'),
              like: true)).toList();
      final isLastPage = newItems.length < _pageSize;

      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PagedSliverGrid(
      pagingController: _pagingController,
      showNewPageProgressIndicatorAsGridChild: false,
      showNewPageErrorIndicatorAsGridChild: false,
      showNoMoreItemsIndicatorAsGridChild: false,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisExtent: 144.h,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 100 / 150,
      ),
      builderDelegate: PagedChildBuilderDelegate<Concept>(
        itemBuilder: (context, concept, index) {
          final c = ref.watch(conceptProvider(concept));
          final conceptState = ref.read(conceptProvider(concept).notifier);
          return wishConceptCard(
            id: c.id,
            profile: c.profile,
            like: c.like,
            conceptState: conceptState,
          );
        },
      ),
    );
  }

  Widget wishConceptCard({
    required int id,
    required String profile,
    required bool like,
    required ConceptState conceptState,
  }) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        InkWell(
          onTap: () {
            locator<NavigationService>().navigateTo(
              routeName: AppRoutes.detailPage,
              argument: id,
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              profile,
              height: 144.h,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: InkWell(
            onTap: () {
              conceptState.setLike(id);
            },
            child: Icon(
              like ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
              color: like ? const Color(0xffff5757) : const Color(0xffffffff),
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
