import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsiveUtils {
  // Private constructor
  ResponsiveUtils._();

  // Screen dimensions
  static double get screenWidth => 1.sw;
  static double get screenHeight => 1.sh;

  // Status bar and bottom bar heights
  static double get statusBarHeight => ScreenUtil().statusBarHeight;
  static double get bottomBarHeight => ScreenUtil().bottomBarHeight;

  // Device type checks
  static bool get isMobile => screenWidth < 768;
  static bool get isTablet => screenWidth >= 768 && screenWidth < 1024;
  static bool get isDesktop => screenWidth >= 1024;

  // Responsive text sizes
  static double get verySmallText => 10.sp;
  static double get smallText => 12.sp;
  static double get normalText => 14.sp;
  static double get mediumText => 16.sp;
  static double get largeText => 18.sp;
  static double get veryLargeText => 20.sp;
  static double get titleText => 22.sp;
  static double get headingText => 24.sp;

  // Responsive spacing
  static double get verySmallSpacing => 2.h;
  static double get smallSpacing => 6.h;
  static double get normalSpacing => 10.h;
  static double get mediumSpacing => 12.h;
  static double get largeSpacing => 16.h;
  static double get veryLargeSpacing => 20.h;
  static double get extraLargeSpacing => 24.h;

  // Responsive padding
  static EdgeInsets get smallPadding => EdgeInsets.all(8.r);
  static EdgeInsets get normalPadding => EdgeInsets.all(12.r);
  static EdgeInsets get mediumPadding => EdgeInsets.all(16.r);
  static EdgeInsets get largePadding => EdgeInsets.all(20.r);

  // Responsive margins
  static EdgeInsets get smallMargin => EdgeInsets.all(8.r);
  static EdgeInsets get normalMargin => EdgeInsets.all(12.r);
  static EdgeInsets get mediumMargin => EdgeInsets.all(16.r);
  static EdgeInsets get largeMargin => EdgeInsets.all(20.r);

  // Responsive border radius
  static BorderRadius get smallRadius => BorderRadius.circular(4.r);
  static BorderRadius get normalRadius => BorderRadius.circular(8.r);
  static BorderRadius get mediumRadius => BorderRadius.circular(12.r);
  static BorderRadius get largeRadius => BorderRadius.circular(16.r);
  static BorderRadius get extraLargeRadius => BorderRadius.circular(24.r);

  // Icon sizes
  static double get smallIcon => 16.r;
  static double get normalIcon => 20.r;
  static double get mediumIcon => 24.r;
  static double get largeIcon => 28.r;
  static double get veryLargeIcon => 32.r;

  // Avatar sizes
  static double get smallAvatar => 32.r;
  static double get normalAvatar => 40.r;
  static double get mediumAvatar => 48.r;
  static double get largeAvatar => 56.r;
  static double get veryLargeAvatar => 64.r;

  // Button heights
  static double get smallButtonHeight => 32.h;
  static double get normalButtonHeight => 40.h;
  static double get mediumButtonHeight => 48.h;
  static double get largeButtonHeight => 56.h;

  // App bar height
  static double get appBarHeight => 56.h;

  // Bottom navigation height
  static double get bottomNavHeight => 60.h;

  // Responsive width functions
  static double width(double percentage) => screenWidth * (percentage / 100);
  static double height(double percentage) => screenHeight * (percentage / 100);

  // Safe area padding
  static EdgeInsets safeAreaPadding(BuildContext context) {
    return EdgeInsets.only(
      top: MediaQuery.of(context).padding.top,
      bottom: MediaQuery.of(context).padding.bottom,
    );
  }

  // Chat specific dimensions
  static double get chatItemHeight => 80.h;
  static double get messageMaxWidth => screenWidth * 0.75;
  static double get chatInputHeight => 48.h;
  
  // Story specific dimensions
  static double get storyItemWidth => 64.r;
  static double get storyItemHeight => 88.h;
}
