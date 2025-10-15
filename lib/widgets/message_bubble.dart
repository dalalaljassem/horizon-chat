import 'package:flutter/material.dart';
import '../models/message.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../constants/app_styles.dart';
import 'ai_avatar.dart';

class MessageBubble extends StatelessWidget {
  final Message message;
  final String? selectedModel;

  const MessageBubble({Key? key, required this.message, this.selectedModel})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (message.isUser) {
      return _buildUserMessage(context);
    } else {
      return _buildAiMessage();
    }
  }

  Widget _buildUserMessage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.75,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingMedium,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: AppColors.messageBubbleUser,
            borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
          ),
          child: Text(message.text, style: AppStyles.bodyLarge),
        ),
      ),
    );
  }

  Widget _buildAiMessage() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AiAvatar(
            size: AppDimensions.avatarSmall,
            iconSize: AppDimensions.iconSmall,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ai Assistant${selectedModel != null ? ' ($selectedModel)' : ''}',
                  style: AppStyles.aiAssistantLabel,
                ),
                const SizedBox(height: 6),
                if (message.isThinking)
                  const Text(
                    'Thinking ...',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  )
                else
                  Text(message.text, style: AppStyles.messageText),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
