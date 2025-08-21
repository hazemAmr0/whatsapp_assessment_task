import 'package:flutter/material.dart';
import '../models/chat_models.dart';

class WhatsAppStoryIndicator extends StatelessWidget {
  final UserStory userStory;
  final double size;

  const WhatsAppStoryIndicator({
    super.key,
    required this.userStory,
    this.size = 60,
  });

  @override
  Widget build(BuildContext context) {
    final stories = userStory.stories;
    final hasUnviewed = userStory.hasUnviewedStories;
    
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          // Background circle
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade300,
            ),
          ),
          
          // Story segments
          if (stories.length == 1) 
            _buildSingleStoryRing(hasUnviewed)
          else if (stories.length == 2)
            _buildDualStoryRings(stories)
          else if (stories.length >= 3)
            _buildMultipleStoryRings(stories),
            
          // Avatar
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.all(size * 0.08),
              child: CircleAvatar(
                backgroundColor: Colors.grey.shade200,
                backgroundImage: userStory.userAvatar != null
                    ? AssetImage(userStory.userAvatar!)
                    : null,
                child: userStory.userAvatar == null
                    ? Icon(
                        Icons.person,
                        color: Colors.grey.shade600,
                        size: size * 0.4,
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSingleStoryRing(bool isUnviewed) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isUnviewed ? const Color(0xFF25D366) : Colors.grey.shade400,
          width: size * 0.05,
        ),
      ),
    );
  }

  Widget _buildDualStoryRings(List<Story> stories) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: DualStoryPainter(
          story1Viewed: stories[0].isViewed,
          story2Viewed: stories[1].isViewed,
          strokeWidth: size * 0.05,
        ),
      ),
    );
  }

  Widget _buildMultipleStoryRings(List<Story> stories) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: MultipleStoryPainter(
          stories: stories,
          strokeWidth: size * 0.05,
        ),
      ),
    );
  }
}

class DualStoryPainter extends CustomPainter {
  final bool story1Viewed;
  final bool story2Viewed;
  final double strokeWidth;

  DualStoryPainter({
    required this.story1Viewed,
    required this.story2Viewed,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;
    
    // First story (top half)
    final paint1 = Paint()
      ..color = story1Viewed ? Colors.grey.shade400 : const Color(0xFF25D366)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.14159 / 2, // Start from top
      3.14159, // Half circle
      false,
      paint1,
    );
    
    // Second story (bottom half)
    final paint2 = Paint()
      ..color = story2Viewed ? Colors.grey.shade400 : const Color(0xFF25D366)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      3.14159 / 2, // Start from bottom
      3.14159, // Half circle
      false,
      paint2,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class MultipleStoryPainter extends CustomPainter {
  final List<Story> stories;
  final double strokeWidth;

  MultipleStoryPainter({
    required this.stories,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;
    
    final segmentAngle = (2 * 3.14159) / stories.length;
    final gapAngle = 0.1; // Small gap between segments
    
    for (int i = 0; i < stories.length; i++) {
      final paint = Paint()
        ..color = stories[i].isViewed ? Colors.grey.shade400 : const Color(0xFF25D366)
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;
      
      final startAngle = (i * segmentAngle) - (3.14159 / 2) + (gapAngle / 2);
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

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
