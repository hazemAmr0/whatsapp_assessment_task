import 'package:flutter/material.dart';
import '../models/chat_models.dart';

class StoryProgressIndicators extends StatelessWidget {
  final List<Story> stories;
  final int currentStoryIndex;
  final Animation<double> progressAnimation;

  const StoryProgressIndicators({
    super.key,
    required this.stories,
    required this.currentStoryIndex,
    required this.progressAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 10,
      left: 16,
      right: 16,
      child: Row(
        children: List.generate(
          stories.length,
          (index) => Expanded(
            child: Container(
              height: 2,
              margin: const EdgeInsets.symmetric(horizontal: 1),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(1),
              ),
              child: AnimatedBuilder(
                animation: progressAnimation,
                builder: (context, child) {
                  double progress = 0.0;
                  if (index < currentStoryIndex) {
                    progress = 1.0; // Completed
                  } else if (index == currentStoryIndex) {
                    progress = progressAnimation.value; // Current
                  }
                  // Future stories remain at 0.0
                  
                  return LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.transparent,
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
