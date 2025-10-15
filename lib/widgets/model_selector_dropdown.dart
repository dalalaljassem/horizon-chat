import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../constants/app_styles.dart';

class ModelSelectorDropdown extends StatelessWidget {
  final String selectedModel;
  final List<String> models;
  final Function(String) onModelSelected;

  const ModelSelectorDropdown({
    Key? key,
    required this.selectedModel,
    required this.models,
    required this.onModelSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      offset: const Offset(0, 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
      ),
      color: AppColors.white,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.inputBackground,
          borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(selectedModel, style: AppStyles.modelSelector),
            const SizedBox(width: 6),
            Icon(Icons.keyboard_arrow_down, color: Colors.grey[700], size: 20),
          ],
        ),
      ),
      onSelected: onModelSelected,
      itemBuilder: (BuildContext context) {
        return models.map((String value) {
          return PopupMenuItem<String>(
            value: value,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              decoration: BoxDecoration(
                color: selectedModel == value
                    ? AppColors.inputBackground
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
              ),
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  color: selectedModel == value
                      ? Colors.black
                      : AppColors.textTertiary,
                  fontWeight: selectedModel == value
                      ? FontWeight.w600
                      : FontWeight.w400,
                ),
              ),
            ),
          );
        }).toList();
      },
    );
  }
}
