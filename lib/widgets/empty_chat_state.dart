import 'package:flutter/material.dart';
import '../constants/app_dimensions.dart';
import '../constants/app_styles.dart';
import 'ai_avatar.dart';

class EmptyChatState extends StatelessWidget {
  final String title;
  final String subtitle;

  const EmptyChatState({
    Key? key,
    this.title = 'Start a conversation',
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AiAvatar(
            size: AppDimensions.avatarLarge,
            iconSize: AppDimensions.iconLarge,
          ),
          const SizedBox(height: 20),
          Text(title, style: AppStyles.headingSmall),
          const SizedBox(height: 8),
          Text(subtitle, style: AppStyles.bodySmall),
        ],
      ),
    );
  }
}
