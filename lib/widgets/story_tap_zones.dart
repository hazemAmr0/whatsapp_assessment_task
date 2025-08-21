import 'package:flutter/material.dart';

class StoryTapZones extends StatelessWidget {
  final Function(TapZone) onTapZone;
  final VoidCallback onPauseStart;
  final VoidCallback onPauseEnd;

  const StoryTapZones({
    super.key,
    required this.onTapZone,
    required this.onPauseStart,
    required this.onPauseEnd,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Row(
        children: [
          // Left tap zone (previous)
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: () => onTapZone(TapZone.previous),
              behavior: HitTestBehavior.translucent,
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          
          // Middle tap zone (pause/resume with long press)
          Expanded(
            flex: 4,
            child: GestureDetector(
              onLongPressStart: (_) => onPauseStart(),
              onLongPressEnd: (_) => onPauseEnd(),
              onLongPressCancel: () => onPauseEnd(),
              behavior: HitTestBehavior.translucent,
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          
          // Right tap zone (next)
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: () => onTapZone(TapZone.next),
              behavior: HitTestBehavior.translucent,
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum TapZone {
  previous,
  next,
  pause,
}
