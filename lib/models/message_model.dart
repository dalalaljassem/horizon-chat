// models/message_model.dart
class MessageModel {
  final String text;
  final bool isUser;
  final bool isThinking;

  MessageModel({
    required this.text,
    required this.isUser,
    this.isThinking = false,
  });
}
