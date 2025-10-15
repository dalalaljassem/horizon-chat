import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppStyles {
  static TextStyle headingLarge = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.15,
  );

  static TextStyle headingMedium = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.textTertiary,
  );

  static TextStyle headingSmall = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textTertiary,
  );

  static TextStyle bodyLarge = const TextStyle(
    fontSize: 16,
    color: Colors.black,
  );

  static TextStyle bodyMedium = TextStyle(
    fontSize: 15,
    color: AppColors.textSecondary,
  );

  static TextStyle bodySmall = TextStyle(
    fontSize: 14,
    color: AppColors.textSecondary,
  );

  static TextStyle hintText = TextStyle(
    color: AppColors.textHint,
    fontSize: 16,
  );

  static const TextStyle aiAssistantLabel = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  static const TextStyle messageText = TextStyle(
    fontSize: 16,
    color: Colors.black87,
    height: 1.5,
  );

  static const TextStyle modelSelector = TextStyle(
    color: Colors.black,
    fontSize: 17,
    fontWeight: FontWeight.w500,
  );

  // Box Shadows
  static List<BoxShadow> lightShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.06),
      blurRadius: 10,
      offset: const Offset(0, 2),
    ),
  ];

  static List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.04),
      blurRadius: 6,
      offset: const Offset(0, 3),
    ),
  ];

  static List<BoxShadow> avatarShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.04),
      blurRadius: 4,
      offset: const Offset(0, 2),
    ),
  ];
}
