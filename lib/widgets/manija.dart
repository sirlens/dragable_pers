import 'package:flutter/material.dart';

class Manija extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color.fromARGB(255, 228, 55, 55),
          Color.fromARGB(255, 140, 16, 16),
          Color.fromARGB(255, 70, 10, 10),
          Color.fromARGB(255, 0, 0, 0),
        ],
        stops: [
          0.1,
          0.33,
          0.7,
          1.0,
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    Path path = Path();

    paint.color = Color.fromARGB(255, 250, 103, 5);
    path = Path();
    path.lineTo(size.width, size.height / 2);
    path.cubicTo(size.width, size.height * 0.61, size.width * 0.62,
        size.height * 0.66, size.width * 0.43, size.height * 0.73);
    path.cubicTo(size.width * 0.16, size.height * 0.83, size.width * 0.03,
        size.height * 0.91, 0, size.height);
    path.cubicTo(0, size.height, 0, 0, 0, 0);
    path.cubicTo(size.width * 0.03, size.height * 0.09, size.width * 0.16,
        size.height * 0.17, size.width * 0.43, size.height * 0.27);
    path.cubicTo(size.width * 0.62, size.height * 0.34, size.width,
        size.height * 0.39, size.width, size.height / 2);
    path.cubicTo(size.width, size.height / 2, size.width, size.height / 2,
        size.width, size.height / 2);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
