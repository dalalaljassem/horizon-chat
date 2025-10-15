import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class SparkleIconPainter extends CustomPainter {
  final Color color;

  SparkleIconPainter({this.color = AppColors.sparkleBlue});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final largeStarSize = size.width * 0.5;
    final smallStarSize = size.width * 0.28;

    _drawFourPointStar(
      canvas,
      paint,
      Offset(centerX + size.width * 0.15, centerY + size.height * 0.15),
      largeStarSize,
    );

    _drawFourPointStar(
      canvas,
      paint,
      Offset(centerX - size.width * 0.2, centerY - size.height * 0.2),
      smallStarSize,
    );

    _drawFourPointStar(
      canvas,
      paint,
      Offset(centerX + size.width * 0.25, centerY - size.height * 0.15),
      smallStarSize * 0.6,
    );
  }

  void _drawFourPointStar(
    Canvas canvas,
    Paint paint,
    Offset center,
    double size,
  ) {
    final path = Path();
    path.moveTo(center.dx, center.dy - size / 2);
    path.quadraticBezierTo(
      center.dx + size * 0.05,
      center.dy - size * 0.05,
      center.dx + size / 2,
      center.dy,
    );
    path.quadraticBezierTo(
      center.dx + size * 0.05,
      center.dy + size * 0.05,
      center.dx,
      center.dy + size / 2,
    );
    path.quadraticBezierTo(
      center.dx - size * 0.05,
      center.dy + size * 0.05,
      center.dx - size / 2,
      center.dy,
    );
    path.quadraticBezierTo(
      center.dx - size * 0.05,
      center.dy - size * 0.05,
      center.dx,
      center.dy - size / 2,
    );
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
