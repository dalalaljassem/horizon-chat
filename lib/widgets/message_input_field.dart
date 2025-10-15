import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../constants/app_styles.dart';

class MessageInputField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Function(String)? onSubmitted;
  final VoidCallback? onSendPressed;
  final Color? backgroundColor;
  final Color? sendButtonColor;

  const MessageInputField({
    Key? key,
    this.controller,
    this.hintText,
    this.onSubmitted,
    this.onSendPressed,
    this.backgroundColor,
    this.sendButtonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = controller ?? TextEditingController();

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusXXLarge),
        boxShadow: AppStyles.lightShadow,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: textController,
              onSubmitted: onSubmitted,
              decoration: InputDecoration(
                hintText: hintText ?? 'Type a message...',
                hintStyle: AppStyles.hintText,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 14,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: GestureDetector(
              onTap: onSendPressed,
              child: Container(
                width: AppDimensions.buttonCircle,
                height: AppDimensions.buttonCircle,
                decoration: BoxDecoration(
                  color: sendButtonColor ?? AppColors.sendButton,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.send,
                  color: AppColors.white,
                  size: AppDimensions.buttonIcon,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
