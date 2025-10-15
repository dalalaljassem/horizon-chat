import 'package:flutter/material.dart';
import 'dart:ui';

class BlurredCircle extends StatelessWidget {
  final double size;
  final Color color;
  final double opacity;
  final double sigmaX;
  final double sigmaY;

  const BlurredCircle({
    Key? key,
    required this.size,
    required this.color,
    this.opacity = 0.6,
    this.sigmaX = 80,
    this.sigmaY = 80,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withOpacity(opacity),
        ),
      ),
    );
  }
}
