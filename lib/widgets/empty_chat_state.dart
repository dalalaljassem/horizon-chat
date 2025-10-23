import 'package:flutter/material.dart';
import 'sparkle_icon_painter.dart';

class EmptyChatState extends StatelessWidget {
  final String selectedModel;

  const EmptyChatState({Key? key, required this.selectedModel})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.025),
              Text(
                'Start a conversation',
                style: TextStyle(
                  fontSize: width * 0.053,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: height * 0.01),
              Text(
                'Ask me anything about $selectedModel',
                style: TextStyle(
                  fontSize: width * 0.037,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
