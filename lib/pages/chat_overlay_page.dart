import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../widgets/blurred_circle.dart';
import '../widgets/greeting_section.dart';
import '../widgets/popular_topics_section.dart';
import '../widgets/message_input_field.dart';
import 'chat_screen.dart';

class ChatOverlayPage extends StatefulWidget {
  const ChatOverlayPage({super.key});

  @override
  State<ChatOverlayPage> createState() => _ChatOverlayPageState();
}

class _ChatOverlayPageState extends State<ChatOverlayPage> {
  final TextEditingController _messageController = TextEditingController();

  // Define your topics here
  final List<TopicData> _topics = [
    TopicData(
      icon: Icons.auto_awesome,
      text: 'Talk to your data\ntopics here',
      color: Colors.blue,
      message: 'Talk to your data topics here',
    ),
    TopicData(
      icon: Icons.flag_outlined,
      text: 'Talk to your data\ntopics here',
      color: Colors.red,
      message: 'Talk to your data topics here',
    ),
    TopicData(
      icon: Icons.lightbulb_outline,
      text: 'Get insights about\nyour business',
      color: Colors.orange,
      message: 'Get insights about your business',
    ),
  ];

  void _navigateToChat(String message) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => ChatScreen(initialMessage: message)),
    );
  }

  void _handleSendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      _navigateToChat(_messageController.text.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.overlayBackground,
      body: Stack(
        children: [
          // Blurred background circles
          Positioned(
            top: height * 0.05,
            right: -width * 0.15,
            child: BlurredCircle(
              size: width * 0.65,
              color: AppColors.blurPurple,
            ),
          ),
          Positioned(
            top: height * 0.08,
            left: width * 0.15,
            child: BlurredCircle(size: width * 0.6, color: AppColors.blurBlue),
          ),
          Positioned(
            bottom: height * 0.25,
            left: -width * 0.2,
            child: BlurredCircle(size: width * 0.55, color: AppColors.blurGray),
          ),

          SafeArea(
            child: Column(
              children: [
                // Close button
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: AppDimensions.paddingSmall,
                      top: AppDimensions.paddingSmall,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.close, size: 28),
                      color: Colors.grey[600],
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ),

                // Greeting section
                const GreetingSection(userName: 'Meshaal'),

                const Spacer(),

                // Popular Topics section
                PopularTopicsSection(
                  topics: _topics,
                  onTopicTap: _navigateToChat,
                ),

                const SizedBox(height: 20),

                // Message input
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppDimensions.paddingLarge,
                    0,
                    AppDimensions.paddingLarge,
                    AppDimensions.paddingLarge,
                  ),
                  child: MessageInputField(
                    controller: _messageController,
                    onSubmitted: (text) {
                      if (text.trim().isNotEmpty) {
                        _navigateToChat(text.trim());
                      }
                    },
                    onSendPressed: _handleSendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}
