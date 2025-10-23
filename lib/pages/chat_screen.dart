import 'package:flutter/material.dart';
import '../models/message_model.dart';
import '../widgets/chat_app_bar.dart';
import '../widgets/message_bubble.dart';
import '../widgets/popular_topics_section.dart';
import '../widgets/message_input_field.dart';

class ChatScreen extends StatefulWidget {
  final String? initialMessage;
  final String? selectedModel;

  const ChatScreen({Key? key, this.initialMessage, this.selectedModel})
    : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late String selectedModel;
  List<MessageModel> messages = [];

  @override
  void initState() {
    super.initState();
    selectedModel = widget.selectedModel ?? 'Compliance';

    if (widget.initialMessage != null && widget.initialMessage!.isNotEmpty) {
      messages.add(MessageModel(text: widget.initialMessage!, isUser: true));
      messages.add(MessageModel(text: '', isUser: false, isThinking: true));

      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() {
            messages.removeLast();
            messages.add(
              MessageModel(
                text:
                    'Thank you for your message! I\'m here to help you with $selectedModel-related questions. How can I assist you further?',
                isUser: false,
              ),
            );
          });
          _scrollToBottom();
        }
      });

      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
    }
  }

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      messages.add(MessageModel(text: text.trim(), isUser: true));
      messages.add(MessageModel(text: '', isUser: false, isThinking: true));
    });

    _messageController.clear();
    _scrollToBottom();

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          messages.removeLast();
          messages.add(
            MessageModel(
              text:
                  'I understand your query. Let me help you with that based on the $selectedModel guidelines.',
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
      backgroundColor: Colors.white,
      appBar: ChatAppBar(
        selectedModel: selectedModel,
        onModelChanged: (newModel) {
          setState(() {
            selectedModel = newModel;
          });
        },
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth.isFinite
              ? constraints.maxWidth
              : MediaQuery.of(context).size.width;
          final height = constraints.maxHeight.isFinite
              ? constraints.maxHeight
              : MediaQuery.of(context).size.height;

          double horizontalPadding(double factor) => width * factor;
          double verticalPadding(double factor) => height * factor;

          return Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 900),
              child: Column(
                children: [
                  Expanded(
                    child: messages.isEmpty
                        ? const SizedBox.shrink()
                        : ListView.builder(
                            controller: _scrollController,
                            padding: EdgeInsets.symmetric(
                              horizontal: horizontalPadding(0.04),
                              vertical: verticalPadding(0.015),
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

                  if (messages.isEmpty)
                    Padding(
                      padding: EdgeInsets.symmetric(),
                      child: PopularTopicsSection(onTopicTap: _sendMessage),
                    ),

                  SafeArea(
                    top: false,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: horizontalPadding(0.03),
                        right: horizontalPadding(0.03),
                        bottom: verticalPadding(0.01),
                      ),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: height * 0.18,
                          minHeight: height * 0.06,
                        ),
                        child: MessageInput(
                          controller: _messageController,
                          onSend: () => _sendMessage(_messageController.text),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
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
