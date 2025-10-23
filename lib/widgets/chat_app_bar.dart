import 'package:flutter/material.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String selectedModel;
  final Function(String) onModelChanged;

  const ChatAppBar({
    Key? key,
    required this.selectedModel,
    required this.onModelChanged,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = MediaQuery.of(context).size.width;

        return AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            iconSize: width * 0.055,
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: DropdownButton<String>(
            value: selectedModel,
            underline: Container(),
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.black,
              size: width * 0.06,
            ),
            style: TextStyle(
              color: Colors.black,
              fontSize: width * 0.048,
              fontWeight: FontWeight.w500,
            ),
            items: ['Compliance', 'Shariaa'].map((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                onModelChanged(newValue);
              }
            },
          ),
          centerTitle: true,
        );
      },
    );
  }
}
