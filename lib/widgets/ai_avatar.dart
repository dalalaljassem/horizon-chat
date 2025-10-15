import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_styles.dart';
import 'sparkle_icon_painter.dart';

class AiAvatar extends StatelessWidget {
  final double size;
  final double iconSize;
  final Color? backgroundColor;

  const AiAvatar({
    Key? key,
    this.size = 36,
    this.iconSize = 18,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.aiAvatarBackground,
        shape: BoxShape.circle,
        boxShadow: AppStyles.avatarShadow,
      ),
      child: Center(
        child: CustomPaint(
          size: Size(iconSize, iconSize),
          painter: SparkleIconPainter(),
        ),
      ),
    );
  }
}
