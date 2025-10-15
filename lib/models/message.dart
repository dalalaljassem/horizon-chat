class Message {
  final String text;
  final bool isUser;
  final bool isThinking;

  Message({required this.text, required this.isUser, this.isThinking = false});
}
