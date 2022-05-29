import 'package:flutter/material.dart';

class SplashCanvas extends CustomPainter {
  double height;
  double width;

  SplashCanvas({required  this.width, required  this.height});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = Colors.blue;

    paint.style = PaintingStyle.fill;

    paint.strokeWidth = 5;

    final path = Path();

    path.lineTo(0, height * 0.1);

    path.quadraticBezierTo(width * 0.15, height * 0.18,
        width * 0.35, height * 0.13);

    path.quadraticBezierTo(width * 0.55, height * 0.07,
        width * 0.8, height * 0.1);
    path.quadraticBezierTo(
        width * 0.98, height * 0.13, width, height * 0.12);

    path.lineTo(width, 0);

    path.moveTo(0, height);

    path.quadraticBezierTo(
        width * 0.65, height * 0.75, width, height);

    canvas.drawPath(path, paint);

    canvas.scale(0.25, 0.25);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
