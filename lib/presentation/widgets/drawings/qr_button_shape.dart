import 'package:flutter/material.dart';

class QrButtonShape extends CustomPainter {
  final Color backgroundColor;
  QrButtonShape({
    required this.backgroundColor,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final double height = size.height;
    final double width = size.width;
    var paint = Paint();
    paint.color = backgroundColor;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(width, 0);
    path.quadraticBezierTo(width, height * 0.2, width * 0.8, height * 0.2);
    path.lineTo(width * 0.8, height * 0.2);

    path.lineTo(width * 0.2, height * 0.2);
    path.quadraticBezierTo(0, height * 0.2, 0, height * 0.4);
    path.lineTo(0, height * 0.4);

    path.lineTo(0, height * 0.6);
    path.quadraticBezierTo(0, height * 0.8, width * 0.2, height * 0.8);
    path.lineTo(width * 0.2, height * 0.8);

    path.lineTo(width * 0.8, height * 0.8);
    path.quadraticBezierTo(width, height * 0.8, width, height);
    path.lineTo(width, height);
    canvas.drawShadow(path, Colors.black, 3, false);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
