import 'package:flutter/material.dart';
import '../models/chat_mode_model.dart';

class ChatModeCard extends StatelessWidget {
  final ChatModeModel chatMode;
  final VoidCallback onTap;

  const ChatModeCard({Key? key, required this.chatMode, required this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final parentWidth = constraints.maxWidth;
        final cardHeight = MediaQuery.of(context).size.height * 0.15;

        return GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            height: cardHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(parentWidth * 0.04),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(parentWidth * 0.04),
              child: Row(
                children: [
                  Container(
                    width: parentWidth * 0.14,
                    height: parentWidth * 0.14,
                    decoration: BoxDecoration(
                      color: chatMode.iconColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      chatMode.icon,
                      color: chatMode.iconColor,
                      size: parentWidth * 0.07,
                    ),
                  ),
                  SizedBox(width: parentWidth * 0.04),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          chatMode.title,
                          style: TextStyle(
                            fontSize: parentWidth * 0.045,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: parentWidth * 0.01),
                        Text(
                          chatMode.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: parentWidth * 0.032,
                            color: Colors.grey[600],
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: parentWidth * 0.045,
                    color: Colors.grey[400],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
