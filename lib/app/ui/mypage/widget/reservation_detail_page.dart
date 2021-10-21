import 'package:flutter/material.dart';

class ReservationDetailPage extends StatelessWidget {
  const ReservationDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 188,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            color: Colors.lightGreen[100 * (index % 9)],
            child: Text(
              'Reservation Detail Item ${index + 1}',
              style: const TextStyle(fontSize: 20),
            ),
          );
        },
        childCount: 100,
      ),
    );
  }
}
