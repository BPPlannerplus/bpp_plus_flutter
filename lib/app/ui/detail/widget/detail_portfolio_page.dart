import 'package:bpp_riverpod/app/model/shop_concept.dart';
import 'package:bpp_riverpod/app/routes/routes.dart';
import 'package:flutter/material.dart';

class DetailPortfolioPage extends StatelessWidget {
  const DetailPortfolioPage({
    Key? key,
    required this.shopConcepts,
    required this.getData,
  }) : super(key: key);

  final ShopConcepts shopConcepts;
  final Future<void> Function() getData;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        mainAxisExtent: 144,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          if (shopConcepts.next.isNotEmpty &&
              index == shopConcepts.shopConcepts.length - 10) {
            getData();
          }
          if (index == shopConcepts.shopConcepts.length) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.detailPortfolioPage,
                arguments: Portfolio(
                  profile: shopConcepts.shopConcepts[index].profile,
                ),
              );
            },
            child: Image.network(
              shopConcepts.shopConcepts[index].profile,
              height: 144,
            ),
          );
        },
        childCount: shopConcepts.shopConcepts.length +
            (shopConcepts.next.isNotEmpty ? 1 : 0),
      ),
    );
  }
}
