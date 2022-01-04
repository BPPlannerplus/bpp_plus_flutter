import 'package:flutter/material.dart';

class CircleStatusCard extends StatelessWidget {
  const CircleStatusCard({
    Key? key,
    required this.index,
    required this.selColor,
    required this.unSelColor,
  }) : super(key: key);

  final int index;
  final Color selColor;
  final Color unSelColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == 0 ? selColor : unSelColor,
          ),
        ),
        const SizedBox(width: 8),
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == 1 ? selColor : unSelColor,
          ),
        ),
        const SizedBox(width: 8),
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == 2 ? selColor : unSelColor,
          ),
        ),
      ],
    );
  }
}
