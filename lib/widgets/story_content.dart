import 'package:flutter/material.dart';
import '../models/chat_models.dart';

class StoryContent extends StatelessWidget {
  final Story story;
  final Animation<Offset> slideAnimation;

  const StoryContent({
    super.key,
    required this.story,
    required this.slideAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: slideAnimation,
      child: Stack(
        children: [
          // Story Image
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(story.mediaUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          
          // Gradient overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.4),
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black.withOpacity(0.4),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
