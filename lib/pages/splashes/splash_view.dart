import 'package:flutter/material.dart';

class SplashCanvas extends CustomPainter {
  const SplashCanvas();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = Colors.blue;

    paint.style = PaintingStyle.fill;

    paint.strokeWidth = 5;

    final path = Path();

    path.lineTo(0, size.height * 0.1);

    path.quadraticBezierTo(size.width * 0.15, size.height * 0.18,
        size.width * 0.35, size.height * 0.13);

    path.quadraticBezierTo(size.width * 0.55, size.height * 0.07,
        size.width * 0.8, size.height * 0.1);
    path.quadraticBezierTo(
        size.width * 0.98, size.height * 0.13, size.width, size.height * 0.12);

    path.lineTo(size.width, 0);

    path.moveTo(0, size.height);

    path.quadraticBezierTo(
        size.width * 0.65, size.height * 0.75, size.width, size.height);

    canvas.drawPath(path, paint);

    canvas.scale(0.25, 0.25);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
