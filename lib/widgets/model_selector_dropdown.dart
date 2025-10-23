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
    final screenWidth = MediaQuery.of(context).size.width;

    double scaleFont(double factor) => (screenWidth * factor).clamp(12.0, 20.0);

    return PopupMenuButton<String>(
      offset: const Offset(0, 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
      ),
      color: AppColors.white,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: screenWidth * 0.025,
        ),
        decoration: BoxDecoration(
          color: AppColors.inputBackground,
          borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                selectedModel,
                style: AppStyles.modelSelector.copyWith(
                  fontSize: scaleFont(0.045),
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: screenWidth * 0.015),
            Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey[700],
              size: scaleFont(0.05),
            ),
          ],
        ),
      ),
      onSelected: onModelSelected,
      itemBuilder: (BuildContext context) {
        return models.map((String value) {
          final isSelected = selectedModel == value;

          return PopupMenuItem<String>(
            value: value,
            padding: EdgeInsets.zero,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context, value);
                  onModelSelected(value);
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    color: selectedModel == value
                        ? AppColors.inputBackground
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(
                      AppDimensions.radiusSmall,
                    ),
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
              ),
            ),
          );
        }).toList();
      },
    );
  }
}
