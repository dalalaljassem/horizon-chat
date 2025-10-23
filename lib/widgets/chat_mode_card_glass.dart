import 'package:flutter/material.dart';
import 'dart:ui';
import '../models/chat_mode_model.dart';

class ChatModeCardGlass extends StatelessWidget {
  final ChatModeModel chatMode;
  final VoidCallback onTap;
  final double cardBgOpacity;
  final Color circleBgColor;
  final double circleOpacity;

  const ChatModeCardGlass({
    Key? key,
    required this.chatMode,
    required this.onTap,
    required this.cardBgOpacity,
    required this.circleBgColor,
    required this.circleOpacity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final parentWidth = constraints.maxWidth;
        final screenHeight = MediaQuery.of(context).size.height;
        final cardHeight = screenHeight * 0.17;

        return GestureDetector(
          onTap: onTap,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(parentWidth * 0.04),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                width: double.infinity,
                height: cardHeight,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(cardBgOpacity),
                  borderRadius: BorderRadius.circular(parentWidth * 0.04),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.1),
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(parentWidth * 0.04),
                  child: Row(
                    children: [
                      Container(
                        width: parentWidth * 0.14,
                        height: parentWidth * 0.14,
                        decoration: BoxDecoration(
                          color: circleBgColor.withOpacity(circleOpacity),
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
                                fontSize: parentWidth * 0.048,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF2C2C2E),
                              ),
                            ),
                            SizedBox(height: parentWidth * 0.015),
                            Text(
                              chatMode.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: parentWidth * 0.034,
                                color: const Color(0xFF6C6C70),
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
            ),
          ),
        );
      },
    );
  }
}
