import 'package:flutter/material.dart';

class SplashCanvasRegister extends CustomPainter {
  SplashCanvasRegister({required  this.width, required  this.height});
  double width ;
  double height ;


  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = Colors.blue;

    paint.style = PaintingStyle.fill;

    paint.strokeWidth = 5;

    final path = Path();
    

    path.lineTo(0, height * 0.1);

    path.quadraticBezierTo(width * 0.2, height * 0.13,
        width * 0.35, height * 0.13);

    path.quadraticBezierTo(
        width * 0.98, height * 0.13, width, height * 0.12);

    path.lineTo(width, 0);

    path.moveTo(0, height);

    path.quadraticBezierTo(
        width * 0.15, height * 0.95, width, height);

    canvas.drawPath(path, paint);

    canvas.scale(0.25, 0.25);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
