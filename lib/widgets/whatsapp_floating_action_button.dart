import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';

class WhatsAppFloatingActionButton extends StatelessWidget {
  final int currentIndex;

  const WhatsAppFloatingActionButton({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final ButtonConfig config = _getButtonConfig(currentIndex);
    
    return FloatingActionButton(
      onPressed: config.onPressed,
      backgroundColor: AppColors.primaryDark,
      child: Icon(
        config.icon,
        color: Colors.white,
        size: 24.sp,
      ),
    );
  }

  ButtonConfig _getButtonConfig(int index) {
    switch (index) {
      case 0: // Chats
        return ButtonConfig(
          icon: Icons.chat,
          onPressed: () {
            // TODO: Start new chat
          },
        );
      case 1: // Status
        return ButtonConfig(
          icon: Icons.camera_alt,
          onPressed: () {
            // TODO: Add new status
          },
        );
      case 2: // Calls
        return ButtonConfig(
          icon: Icons.add_call,
          onPressed: () {
            // TODO: Make new call
          },
        );
      default:
        return ButtonConfig(
          icon: Icons.chat,
          onPressed: () {},
        );
    }
  }
}

class ButtonConfig {
  final IconData icon;
  final VoidCallback onPressed;

  ButtonConfig({
    required this.icon,
    required this.onPressed,
  });
}
