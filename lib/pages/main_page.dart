import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'chat_overlay_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.delta.dy > 10) {
            Navigator.of(context).push(
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 400),
                pageBuilder: (_, __, ___) => const ChatOverlayPage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                      return SlideTransition(
                        position:
                            Tween(
                              begin: const Offset(0.0, -1.0),
                              end: Offset.zero,
                            ).animate(
                              CurvedAnimation(
                                parent: animation,
                                curve: Curves.easeInOut,
                              ),
                            ),
                        child: child,
                      );
                    },
              ),
            );
          }
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: const Text(
            'Pull down anywhere to open chat',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
