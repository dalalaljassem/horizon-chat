import 'package:flutter/material.dart';
import 'dart:ui';
import '../models/chat_mode_model.dart';
import '../widgets/chat_mode_card_glass.dart';
import 'chat_screen.dart';

class ChatSelectionPage extends StatelessWidget {
  const ChatSelectionPage({super.key});

  // Design constants
  static const Color pageBackground = Color(0xFFEDEFF1);
  static const double cardBgOpacity = 0.03;
  static const Color circleBgColor = Color(0xFFF4F7F9);
  static const double circleOpacity = 0.48;
  static const Color iconColor = Color(0xFF007BFF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackground,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;
          final horizontalPadding = width * 0.06;

          return Stack(
            children: [
              // Background blurred circles
              Positioned(
                top: height * 0.12,
                right: -width * 0.12,
                child: _blurredCircle(width * 0.58, const Color(0xFFE3DAEF)),
              ),
              Positioned(
                top: height * 0.10,
                right: width * 0.18,
                child: _blurredCircle(width * 0.58, const Color(0xFFDAE1EB)),
              ),
              Positioned(
                bottom: height * 0.18,
                left: -width * 0.18,
                child: _blurredCircle(width * 0.55, const Color(0xFFDAE1EB)),
              ),

              SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: const Icon(Icons.close),
                          color: Colors.grey[700],
                          iconSize: width * 0.065,
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: height * 0.02),
                        child: _buildGreeting(width),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: height * 0.015),
                        child: Text(
                          'Please select a chat mode',
                          style: TextStyle(
                            fontSize: width * 0.04,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),

                      Spacer(),

                      _buildChatModeCards(context, width, height),
                      SizedBox(height: height * 0.03),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _blurredCircle(double size, Color color) {
    final sigmaMultiplier = 0.22;
    final sigma = (size * sigmaMultiplier).clamp(20.0, 140.0);

    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    );
  }

  Widget _buildGreeting(double width) {
    return Column(
      children: [
        Text(
          'Hi Meshaal!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: width * 0.075,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
            height: 1.1,
          ),
        ),
        Text(
          'How can I help you?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: width * 0.075,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
            height: 1.1,
          ),
        ),
      ],
    );
  }

  Widget _buildChatModeCards(
    BuildContext context,
    double width,
    double height,
  ) {
    final chatModes = [
      ChatModeModel(
        title: 'Compliance Chatbot',
        description:
            'Upholds regulatory standards and ethical governance across all KFH operations.',
        icon: Icons.lightbulb_outline,
        iconColor: iconColor,
        mode: 'Compliance',
      ),
      ChatModeModel(
        title: 'Shariaa Chatbot',
        description:
            'Ensures all KFH products and services align with Islamic principles and values.',
        icon: Icons.nightlight_round,
        iconColor: iconColor,
        mode: 'Shariaa',
      ),
    ];

    return Column(
      children: chatModes.map((chatMode) {
        return Padding(
          padding: EdgeInsets.only(bottom: height * 0.02),
          child: ChatModeCardGlass(
            chatMode: chatMode,
            cardBgOpacity: cardBgOpacity,
            circleBgColor: circleBgColor,
            circleOpacity: circleOpacity,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ChatScreen(selectedModel: chatMode.mode),
                ),
              );
            },
          ),
        );
      }).toList(),
    );
  }
}
