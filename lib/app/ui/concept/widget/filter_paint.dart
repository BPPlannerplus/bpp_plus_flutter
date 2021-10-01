import 'package:flutter/material.dart';

class ConceptPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bubbleSize = Size(size.width, size.height);
    final sideX = bubbleSize.width / 8;
    final sideY = bubbleSize.height / 2;

    final bubblePath = Path()
      ..moveTo(sideX * 2, 0)
      ..arcTo(const Offset(0, 0) & Size(sideX * 4, sideY * 2), -1.5, -3, false)
      ..lineTo(sideX * 2, bubbleSize.height)
      ..arcTo(Offset(sideX * 4, 0) & Size(sideX * 4, sideY * 2), 1.5, -3, false)
      ..lineTo(sideX * 2, 0);

    final paint = Paint()
      ..color = Colors.lightBlueAccent
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    canvas.drawPath(bubblePath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
