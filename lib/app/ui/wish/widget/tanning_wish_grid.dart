import 'package:flutter/material.dart';

class TanningWishGrid extends StatelessWidget {
  const TanningWishGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisExtent: 188,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            color: Colors.orange[100 * (index % 9)],
            child: Text(
              'Tanning Item ${index + 1}',
              style: const TextStyle(fontSize: 20),
            ),
          );
        },
        childCount: 100,
      ),
    );
  }
}