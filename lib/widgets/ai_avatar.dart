import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_colors.dart';
import '../constants/app_styles.dart';

class AiAvatar extends StatelessWidget {
  final double size;
  final double iconSize;
  final Color? backgroundColor;
  final String svgAsset;

  const AiAvatar({
    super.key,
    this.size = 36,
    this.iconSize = 18,
    this.backgroundColor,
    required this.svgAsset,
  });

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
        child: SvgPicture.asset(
          svgAsset,
          width: iconSize,
          height: iconSize,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
