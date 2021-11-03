import 'package:bpp_riverpod/app/model/shop/shop_concept.dart';
import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:bpp_riverpod/app/util/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class DetailPortfolioPage extends ConsumerStatefulWidget {
  const DetailPortfolioPage({
    Key? key,
    required this.pagingController,
  }) : super(key: key);

  final PagingController<int, ShopConcept> pagingController;

  @override
  ConsumerState<DetailPortfolioPage> createState() =>
      _DetailPortfolioPageState();
}

class _DetailPortfolioPageState extends ConsumerState<DetailPortfolioPage> {
  @override
  Widget build(BuildContext context) {
    return PagedSliverGrid(
      pagingController: widget.pagingController,
      showNewPageProgressIndicatorAsGridChild: false,
      showNewPageErrorIndicatorAsGridChild: false,
      showNoMoreItemsIndicatorAsGridChild: false,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisExtent: 144,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 100 / 150,
      ),
      builderDelegate: PagedChildBuilderDelegate<ShopConcept>(
        itemBuilder: (context, sc, index) {
          return InkWell(
            onTap: () {
              locator<NavigationService>().navigateTo(
                routeName: AppRoutes.detailPortfolioPage,
                argument: sc.profile,
              );
            },
            child: Image.network(
              sc.profile,
              height: 144,
            ),
          );
        },
      ),
    );
  }
}
