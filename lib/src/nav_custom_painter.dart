import 'package:flutter/material.dart';

class NavCustomPainter extends CustomPainter {
  late double loc;
  late double s;
  Color color;
  TextDirection textDirection;
  double curveHeight;
  double curveWidth;
  double curveLeftRightRadius;
  double curveInside;

  NavCustomPainter(
    double startingLoc,
    int itemsLength,
    this.color,
    this.textDirection, {
    this.curveHeight = 0.60,
    this.curveInside = 0.20,
    this.curveLeftRightRadius = 0.1,
    this.curveWidth = 0.4,
  }) {
    final span = 1.0 / itemsLength;
    s = 0.2;
    double l = startingLoc + (span - s) / 2;
    loc = textDirection == TextDirection.rtl ? 0.8 - l : l;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo((loc - curveLeftRightRadius) * size.width, 0)
      ..cubicTo(
        (loc + s * curveWidth) * size.width,
        size.height * curveInside,
        loc * size.width,
        size.height * curveHeight,
        (loc + s * 0.50) * size.width,
        size.height * curveHeight,
      )
      ..cubicTo(
        (loc + s) * size.width,
        size.height * curveHeight,
        (loc + s - s * curveWidth) * size.width,
        size.height * curveInside,
        (loc + s + curveLeftRightRadius) * size.width,
        0,
      )
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
