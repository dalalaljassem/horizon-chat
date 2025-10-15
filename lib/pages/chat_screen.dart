import 'package:flutter/material.dart';
import '../models/message.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../widgets/message_bubble.dart';
import '../widgets/empty_chat_state.dart';
import '../widgets/model_selector_dropdown.dart';

class ChatScreen extends StatefulWidget {
  final String? initialMessage;

  const ChatScreen({Key? key, this.initialMessage}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  String selectedModel = 'Compliance';
  final List<String> availableModels = ['Compliance', 'Shariaa'];

  List<Message> messages = [];

  @override
  void initState() {
    super.initState();
    if (widget.initialMessage != null && widget.initialMessage!.isNotEmpty) {
      _handleInitialMessage();
    }
  }

  void _handleInitialMessage() {
    messages.add(Message(text: widget.initialMessage!, isUser: true));
    messages.add(Message(text: '', isUser: false, isThinking: true));

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          messages.removeLast();
          messages.add(
            Message(
              text:
                  'Thank you for your message! I\'m here to help you with '
                  'compliance-related questions. How can I assist you further?',
              isUser: false,
            ),
          );
        });
        _scrollToBottom();
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    setState(() {
      messages.add(Message(text: _messageController.text, isUser: true));
      messages.add(Message(text: '', isUser: false, isThinking: true));
    });

    _messageController.clear();
    _scrollToBottom();

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          messages.removeLast();
          messages.add(
            Message(
              text:
                  'I understand your query. Let me help you with that based '
                  'on the $selectedModel guidelines.',
              isUser: false,
            ),
          );
        });
        _scrollToBottom();
      }
    });
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          if (messages.isEmpty)
            Expanded(
              child: EmptyChatState(
                subtitle: 'Ask me anything about $selectedModel',
              ),
            )
          else
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingMedium,
                  vertical: AppDimensions.paddingMedium,
                ),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return MessageBubble(
                    message: message,
                    selectedModel: selectedModel,
                  );
                },
              ),
            ),
          _buildInputSection(),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: ModelSelectorDropdown(
        selectedModel: selectedModel,
        models: availableModels,
        onModelSelected: (String newValue) {
          setState(() {
            selectedModel = newValue;
          });
        },
      ),
      centerTitle: true,
    );
  }

  Widget _buildInputSection() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.inputBackground,
                borderRadius: BorderRadius.circular(AppDimensions.radiusXLarge),
              ),
              child: TextField(
                controller: _messageController,
                decoration: InputDecoration(
                  hintText: 'Type a message...',
                  hintStyle: TextStyle(color: Colors.grey[400], fontSize: 15),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 12,
                  ),
                ),
                onSubmitted: (_) => _sendMessage(),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: AppDimensions.buttonCircle,
            height: AppDimensions.buttonCircle,
            decoration: const BoxDecoration(
              color: AppColors.sendButton,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.send, color: AppColors.white, size: 18),
              onPressed: _sendMessage,
              padding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
