import 'package:flutter/material.dart';

class ConceptPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bubbleSize = Size(size.width, size.height);
    final sideX = bubbleSize.width / 8;
    final sideY = bubbleSize.height / 2;

    final bubblePath = Path()
      ..moveTo(sideX + 30, 0)
      ..arcTo(const Offset(0, 0) & Size(30, sideY * 2), -1.5, -3, false)
      ..lineTo(sideX * 4, bubbleSize.height)
      ..arcTo(Offset(sideX * 8 - 30, 0) & Size(30, sideY * 2), 1.5, -3, false)
      ..lineTo(sideX + 30, 0);

    final paint = Paint()
      ..color = const Color(0xff3B75FF)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    canvas.drawPath(bubblePath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
