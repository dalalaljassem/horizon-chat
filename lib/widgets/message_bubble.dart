import 'package:flutter/material.dart';
import '../models/message_model.dart';
import 'sparkle_icon_painter.dart';
import 'ai_avatar.dart';

class MessageBubble extends StatelessWidget {
  final MessageModel message;
  final String selectedModel;

  const MessageBubble({
    Key? key,
    required this.message,
    required this.selectedModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        if (message.isUser) {
          return _buildUserMessage(width);
        } else {
          return _buildAiMessage(width);
        }
      },
    );
  }

  Widget _buildUserMessage(double width) {
    return Padding(
      padding: EdgeInsets.only(bottom: width * 0.04),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          constraints: BoxConstraints(maxWidth: width * 0.75),
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: width * 0.03,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(width * 0.05),
          ),
          child: Text(
            message.text,
            style: TextStyle(fontSize: width * 0.042, color: Colors.black),
          ),
        ),
      ),
    );
  }

  Widget _buildAiMessage(double width) {
    return Padding(
      padding: EdgeInsets.only(bottom: width * 0.04),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width * 0.085,
            height: width * 0.085,
            decoration: BoxDecoration(
              color: const Color(0xFFE8EEF7),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: AiAvatar(
                size: 50,
                iconSize: 50,
                svgAsset: 'assets/fonts/Inter/icons/sparkle_icon.svg',
              ),
            ),
          ),
          SizedBox(width: width * 0.03),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ai Assistant ($selectedModel)',
                  style: TextStyle(
                    fontSize: width * 0.037,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: width * 0.02),
                if (message.isThinking)
                  Text(
                    'Thinking ...',
                    style: TextStyle(
                      fontSize: width * 0.042,
                      color: Colors.black54,
                    ),
                  )
                else
                  Text(
                    message.text,
                    style: TextStyle(
                      fontSize: width * 0.042,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
