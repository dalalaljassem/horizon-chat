import 'package:flutter/material.dart';
import '../constants/app_dimensions.dart';
import '../constants/app_colors.dart';

class TopicCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final VoidCallback onTap;
  final double? width;
  final double? iconSize;

  const TopicCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.color,
    required this.onTap,
    this.width,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? AppDimensions.topicCardWidth,
        padding: const EdgeInsets.all(AppDimensions.paddingMedium),
        decoration: BoxDecoration(
          color: AppColors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: AppDimensions.topicIconSize,
              height: AppDimensions.topicIconSize,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: color,
                size: iconSize ?? AppDimensions.iconMedium,
              ),
            ),
            const Spacer(),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textTertiary,
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
