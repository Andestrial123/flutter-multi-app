import 'package:flutter/material.dart';
import 'package:flutter_multi_app/utils/colors.dart';

class FinishScreenBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = CustomColors.whiteColor;

    final path = Path();
    paint.color = CustomColors.brownDark;
    path.moveTo(size.width, size.height * 0.53);
    path.quadraticBezierTo(size.width * 0.88, size.height * 0.7,
        size.width * 0.45, size.height * 0.75);
    path.quadraticBezierTo(
        size.width * 0.05, size.height * 0.8, 0, size.height);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}