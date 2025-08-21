import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../utils/app_colors.dart';

class WhatsAppStoryRing extends StatelessWidget {
  final Widget child;
  final int storyCount;
  final bool hasUnviewed;
  final double size;
  final double strokeWidth;

  const WhatsAppStoryRing({
    super.key,
    required this.child,
    required this.storyCount,
    required this.hasUnviewed,
    this.size = 70,
    this.strokeWidth = 3,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: StoryRingPainter(
          storyCount: storyCount,
          hasUnviewed: hasUnviewed,
          strokeWidth: strokeWidth,
        ),
        child: Center(
          child: Container(
            width: size - (strokeWidth * 2) - 4,
            height: size - (strokeWidth * 2) - 4,
            child: child,
          ),
        ),
      ),
    );
  }
}

class StoryRingPainter extends CustomPainter {
  final int storyCount;
  final bool hasUnviewed;
  final double strokeWidth;

  StoryRingPainter({
    required this.storyCount,
    required this.hasUnviewed,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    if (storyCount == 0) {
      // No stories - draw grey circle
      final paint = Paint()
        ..color = Colors.grey.withOpacity(0.3)
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;

      canvas.drawCircle(center, radius, paint);
      return;
    }

    if (storyCount == 1) {
      // Single story - draw full circle
      final paint = Paint()
        ..color = hasUnviewed ? AppColors.primaryDark : Colors.grey.withOpacity(0.5)
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;

      canvas.drawCircle(center, radius, paint);
    } else {
      // Multiple stories - draw pie segments with bigger gaps
      final segmentAngle = (2 * math.pi) / storyCount;
      final gapAngle = storyCount == 2 ? 0.15 : (storyCount == 3 ? 0.12 : 0.1); // Bigger gaps for better visibility
      
      for (int i = 0; i < storyCount; i++) {
        final paint = Paint()
          ..color = hasUnviewed ? AppColors.primaryDark : Colors.grey.withOpacity(0.5)
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth
          ..strokeCap = StrokeCap.round;

        final startAngle = (i * segmentAngle) - (math.pi / 2) + (gapAngle / 2);
        final sweepAngle = segmentAngle - gapAngle;

        canvas.drawArc(
          Rect.fromCircle(center: center, radius: radius),
          startAngle,
          sweepAngle,
          false,
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    if (oldDelegate is StoryRingPainter) {
      return oldDelegate.storyCount != storyCount ||
          oldDelegate.hasUnviewed != hasUnviewed ||
          oldDelegate.strokeWidth != strokeWidth;
    }
    return true;
  }
}
