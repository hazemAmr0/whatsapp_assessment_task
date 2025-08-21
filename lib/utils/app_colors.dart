import 'package:flutter/material.dart';

class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  // Light Theme Colors
  static const Color primaryLight = Color(0xFF00A884); // WhatsApp green
  static const Color primaryDarkLight = Color(0xFF008069); // Darker green
  static const Color backgroundLight = Color(0xFFFFFFFF); // White background
  static const Color chatBackgroundLight = Color(0xFFEFEFEF); // Light gray chat background
  static const Color cardLight = Color(0xFFFFFFFF); // White cards
  static const Color textPrimaryLight = Color(0xFF000000); // Black text
  static const Color textSecondaryLight = Color(0xFF667781); // Gray text
  static const Color textTertiaryLight = Color(0xFF8696A0); // Light gray text
  static const Color dividerLight = Color(0xFFE9EDEF); // Light divider
  static const Color iconLight = Color(0xFF54656F); // Icon color
  static const Color chatBubbleOutgoingLight = Color(0xFFD9FDD3); // Light green outgoing
  static const Color chatBubbleIncomingLight = Color(0xFFFFFFFF); // White incoming
  static const Color statusBarLight = Color(0xFF00A884); // Status bar color
  static const Color appBarLight = Color(0xFF00A884); // App bar color
  static const Color unreadCountLight = Color(0xFF25D366); // Unread message count
  static const Color onlineIndicatorLight = Color(0xFF25D366); // Online indicator
  
  // Dark Theme Colors
  static const Color primaryDark = Color(0xFF00A884); // WhatsApp green (same)
  static const Color primaryDarkDark = Color(0xFF008069); // Darker green (same)
  static const Color backgroundDark = Color(0xFF0B141A); // Dark background
  static const Color chatBackgroundDark = Color(0xFF0B141A); // Dark chat background
  static const Color cardDark = Color(0xFF1F2C33); // Dark cards
  static const Color textPrimaryDark = Color(0xFFE9EDEF); // Light text
  static const Color textSecondaryDark = Color(0xFF8696A0); // Gray text
  static const Color textTertiaryDark = Color(0xFF667781); // Darker gray text
  static const Color dividerDark = Color(0xFF2A373E); // Dark divider
  static const Color iconDark = Color(0xFF8696A0); // Dark icon color
  static const Color chatBubbleOutgoingDark = Color(0xFF005C4B); // Dark green outgoing
  static const Color chatBubbleIncomingDark = Color(0xFF1F2C33); // Dark incoming
  static const Color statusBarDark = Color(0xFF0B141A); // Dark status bar
  static const Color appBarDark = Color(0xFF1F2C33); // Dark app bar
  static const Color unreadCountDark = Color(0xFF25D366); // Unread message count (same)
  static const Color onlineIndicatorDark = Color(0xFF25D366); // Online indicator (same)

  // Special Colors (same for both themes)
  static const Color error = Color(0xFFE53E3E);
  static const Color success = Color(0xFF25D366);
  static const Color warning = Color(0xFFFF9500);
  static const Color info = Color(0xFF007AFF);
  static const Color transparent = Color(0x00000000);
  
  // Status Colors
  static const Color seenBlue = Color(0xFF53BDEB);
  static const Color deliveredGray = Color(0xFF667781);
  
  // Story Colors
  static const Color storyViewedGray = Color(0xFF8696A0);
  static const Color storyUnviewedGreen = Color(0xFF00A884);
  
  // Message Status Colors
  static const Color messageSending = Color(0xFF8696A0);
  static const Color messageSent = Color(0xFF8696A0);
  static const Color messageDelivered = Color(0xFF8696A0);
  static const Color messageRead = Color(0xFF53BDEB);

}
