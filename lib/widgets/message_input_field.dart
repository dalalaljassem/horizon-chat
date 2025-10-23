import 'package:flutter/material.dart';

class MessageInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const MessageInput({Key? key, required this.controller, required this.onSend})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : MediaQuery.of(context).size.width;

        double scaleFont(double size) => (width * size).clamp(14.0, 18.0);

        final horizontalPadding = width * 0.04;
        final verticalPadding = width * 0.03;
        final inputHorizontalPadding = width * 0.04;
        final buttonSize = width * 0.12;
        final iconSize = width * 0.055;

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          color: Colors.white,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(width * 0.08),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    maxLines: null,
                    textInputAction: TextInputAction.newline,
                    style: TextStyle(
                      fontSize: scaleFont(0.042),
                      color: Colors.black87,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontSize: scaleFont(0.042),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: inputHorizontalPadding,
                        vertical: width * 0.04,
                      ),
                      isDense: true,
                    ),
                    onSubmitted: (_) => onSend(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(width * 0.015),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: onSend,
                      customBorder: const CircleBorder(),
                      child: Container(
                        width: buttonSize,
                        height: buttonSize,
                        decoration: const BoxDecoration(
                          color: Color(0xFF5B9FED),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.send_rounded,
                          color: Colors.white,
                          size: iconSize,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
