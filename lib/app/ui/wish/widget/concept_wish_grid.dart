import 'package:bpp_riverpod/app/model/concept/concept.dart';
import 'package:bpp_riverpod/app/provider/concept/concept_provier.dart';
import 'package:bpp_riverpod/app/repository/concept_repository.dart';
import 'package:bpp_riverpod/app/repository/shop_wish_repository.dart';
import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/ui/components/card/cached_image_card.dart';
import 'package:bpp_riverpod/app/ui/components/state/custom_load_indicator.dart';
import 'package:bpp_riverpod/app/ui/components/toast/toast.dart';
import 'package:bpp_riverpod/app/ui/wish/widget/no_item_card.dart';
import 'package:bpp_riverpod/app/util/enum.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ConceptWishGrid extends ConsumerStatefulWidget {
  const ConceptWishGrid({Key? key}) : super(key: key);

  @override
  ConsumerState<ConceptWishGrid> createState() => _ConceptWishGridState();
}

class _ConceptWishGridState extends ConsumerState<ConceptWishGrid> {
  final PagingController<int, Concept> _pagingController =
      PagingController(firstPageKey: 1);

  final _fToast = FToast();

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) => _fetchPage(pageKey));
    _fToast.init(context);
    super.initState();
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
          return _WishConceptCard(
            concept: c,
            setLike: () async {
              if (!c.like) {
                showToast(_fToast);
              }
              ref.read(conceptProvider(concept).notifier).setLike(c.id);
              ref.read(conceptRepositoryProvider).setLike(c.id, !c.like);
            },
          );
        },
        firstPageErrorIndicatorBuilder: (context) => customLoadingIndicator(),
        newPageProgressIndicatorBuilder: (context) => customLoadingIndicator(),
        noItemsFoundIndicatorBuilder: (context) => noItemCard(),
      ),
    );
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems =
          await ref.read(shopWishRepositoryProvider).getConceptList(pageKey++);
      final isLastPage = newItems.concepts.length < pageSize;

      if (isLastPage) {
        _pagingController.appendLastPage(newItems.concepts);
      } else {
        _pagingController.appendPage(newItems.concepts, pageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }
}

class _WishConceptCard extends ConsumerWidget {
  const _WishConceptCard({
    Key? key,
    required this.concept,
    required this.setLike,
  }) : super(key: key);

  final Concept concept;
  final Function setLike;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigator = ref.watch(navigatorProvider);

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        InkWell(
            onTap: () {
              navigator.navigateTo(
                routeName: AppRoutes.detailPage,
                argument: concept.shop.id,
              );
            },
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedImageCard(
                    imageUrl: concept.profile,
                    height: 144.h,
                    width: double.infinity,
                    fit: BoxFit.cover))),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: InkWell(
            onTap: () {
              setLike();
            },
            child: Icon(
              concept.like ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
              color: concept.like
                  ? const Color(0xffff5757)
                  : const Color(0xffffffff),
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
