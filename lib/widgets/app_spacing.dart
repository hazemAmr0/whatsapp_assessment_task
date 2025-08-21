import 'package:flutter/material.dart';

/// Utility widget for consistent spacing throughout the app
class AppSpacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;

  // Vertical spacing widgets
  static Widget get verticalXS => const SizedBox(height: xs);
  static Widget get verticalSM => const SizedBox(height: sm);
  static Widget get verticalMD => const SizedBox(height: md);
  static Widget get verticalLG => const SizedBox(height: lg);
  static Widget get verticalXL => const SizedBox(height: xl);
  static Widget get verticalXXL => const SizedBox(height: xxl);

  // Horizontal spacing widgets
  static Widget get horizontalXS => const SizedBox(width: xs);
  static Widget get horizontalSM => const SizedBox(width: sm);
  static Widget get horizontalMD => const SizedBox(width: md);
  static Widget get horizontalLG => const SizedBox(width: lg);
  static Widget get horizontalXL => const SizedBox(width: xl);
  static Widget get horizontalXXL => const SizedBox(width: xxl);

  // EdgeInsets for padding and margins
  static const EdgeInsets paddingXS = EdgeInsets.all(xs);
  static const EdgeInsets paddingSM = EdgeInsets.all(sm);
  static const EdgeInsets paddingMD = EdgeInsets.all(md);
  static const EdgeInsets paddingLG = EdgeInsets.all(lg);
  static const EdgeInsets paddingXL = EdgeInsets.all(xl);

  // Symmetrical padding
  static EdgeInsets paddingHorizontal(double value) => EdgeInsets.symmetric(horizontal: value);
  static EdgeInsets paddingVertical(double value) => EdgeInsets.symmetric(vertical: value);
  
  // Custom spacing
  static Widget vertical(double height) => SizedBox(height: height);
  static Widget horizontal(double width) => SizedBox(width: width);
}
