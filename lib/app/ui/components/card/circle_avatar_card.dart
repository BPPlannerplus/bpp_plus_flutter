import 'package:flutter/material.dart';

class CircleAvatarCard extends StatelessWidget {
  const CircleAvatarCard({
    Key? key,
    required this.backgroundColor,
    required this.img,
  }) : super(key: key);

  final Color backgroundColor;
  final String img;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 32,
      backgroundColor: backgroundColor,
      child: CircleAvatar(
        radius: 31,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(img),
      ),
    );
  }
}
