import 'package:flutter/material.dart';

class ChatBackground extends StatelessWidget {
  final bool isDarkMode;
  final Widget child;

  const ChatBackground({
    super.key,
    required this.isDarkMode,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            isDarkMode 
              ? 'assets/images/DarkWallpaper.png'
              : 'assets/images/LightWallpaper.png'
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
