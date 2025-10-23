// models/chat_mode_model.dart
import 'package:flutter/material.dart';

class ChatModeModel {
  final String title;
  final String description;
  final IconData icon;
  final Color iconColor;
  final String mode;

  ChatModeModel({
    required this.title,
    required this.description,
    required this.icon,
    required this.iconColor,
    required this.mode,
  });
}
