import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_styles.dart';

class GreetingSection extends StatelessWidget {
  final String userName;
  final String greeting;
  final String subtitle;

  const GreetingSection({
    Key? key,
    required this.userName,
    this.greeting = 'How can i help you?',
    this.subtitle = 'Your smart assistant is here',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        children: [
          Text(
            'Hi $userName!',
            textAlign: TextAlign.center,
            style: AppStyles.headingLarge,
          ),
          Text(
            greeting,
            textAlign: TextAlign.center,
            style: AppStyles.headingLarge.copyWith(height: 1.2),
          ),
          const SizedBox(height: 12),
          Text(subtitle, style: AppStyles.bodyMedium),
        ],
      ),
    );
  }
}
