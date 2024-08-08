import 'package:flutter/material.dart';

class CustomBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.brown;

    final path = Path();
    //Upper part of background
    paint.color = const Color(0xFF7c453e);
    path.moveTo(0, size.height * 0.5);
    path.quadraticBezierTo(size.width * 0.15, size.height * 0.3,
        size.width * 0.55, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.95, size.height * 0.2, size.width, 0);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    //Bottom part of background
    path.moveTo(size.width, size.height * 0.5);
    path.quadraticBezierTo(size.width * 0.85, size.height * 0.7,
        size.width * 0.45, size.height * 0.75);
    path.quadraticBezierTo(
        size.width * 0.05, size.height * 0.8, 0, size.height);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}