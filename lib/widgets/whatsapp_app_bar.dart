import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class WhatsAppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WhatsAppAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    return AppBar(
      backgroundColor: isDarkMode 
          ? const Color(0xFF2A3942)  // WhatsApp dark header exact color
          : const Color(0xFF00A884), // WhatsApp green exact color
      elevation: 0,
      title: Text(
        'WhatsApp',
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: Colors.white, // Always white on both themes
          letterSpacing: 0.15,
        ),
      ),
      actions: [
        _AppBarIconButton(
          icon: Icons.camera_alt_outlined,
          isDarkMode: isDarkMode,
          onPressed: () {
            // TODO: Open camera
          },
        ),
        _AppBarIconButton(
          icon: Icons.search,
          isDarkMode: isDarkMode,
          onPressed: () {
            // TODO: Implement search
          },
        ),
        _AppBarPopupMenu(
          isDarkMode: isDarkMode,
          themeProvider: themeProvider,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarIconButton extends StatelessWidget {
  final IconData icon;
  final bool isDarkMode;
  final VoidCallback onPressed;

  const _AppBarIconButton({
    required this.icon,
    required this.isDarkMode,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        color: Colors.white, // Always white on both themes
        size: 24.sp,
      ),
      onPressed: onPressed,
      splashRadius: 22,
    );
  }
}

class _AppBarPopupMenu extends StatelessWidget {
  final bool isDarkMode;
  final ThemeProvider themeProvider;

  const _AppBarPopupMenu({
    required this.isDarkMode,
    required this.themeProvider,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(
        Icons.more_vert,
        color: Colors.white, // Always white on both themes
        size: 24.sp,
      ),
      color: isDarkMode ? const Color(0xFF2A3942) : Colors.white,
      onSelected: (value) {
        switch (value) {
          case 'theme':
            themeProvider.toggleTheme();
            break;
          case 'settings':
            // TODO: Navigate to settings
            break;
        }
      },
      itemBuilder: (context) => [
        _buildPopupMenuItem(
          value: 'theme',
          icon: themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
          text: themeProvider.isDarkMode ? 'Light Mode' : 'Dark Mode',
          isDarkMode: isDarkMode,
        ),
        _buildPopupMenuItem(
          value: 'settings',
          icon: Icons.settings,
          text: 'Settings',
          isDarkMode: isDarkMode,
        ),
      ],
    );
  }

  PopupMenuItem<String> _buildPopupMenuItem({
    required String value,
    required IconData icon,
    required String text,
    required bool isDarkMode,
  }) {
    return PopupMenuItem(
      value: value,
      child: Row(
        children: [
          Icon(
            icon,
            size: 20.sp,
            color: isDarkMode ? Colors.white : Colors.black87,
          ),
          SizedBox(width: 12.w),
          Text(
            text,
            style: TextStyle(
              fontSize: 16.sp,
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
