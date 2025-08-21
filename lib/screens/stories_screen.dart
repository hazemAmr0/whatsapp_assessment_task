import 'package:flutter/material.dart';
import '../models/chat_models.dart';
import '../widgets/story_progress_indicators.dart';
import '../widgets/story_header.dart';
import '../widgets/story_content.dart';
import '../widgets/story_tap_zones.dart';

class StoriesScreen extends StatefulWidget {
  final UserStory initialUserStory;
  final List<UserStory> allUserStories;

  const StoriesScreen({
    super.key,
    required this.initialUserStory,
    required this.allUserStories,
  });

  @override
  State<StoriesScreen> createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen>
    with TickerProviderStateMixin {
  late AnimationController _progressController;
  late AnimationController _slideController;
  late Animation<double> _progressAnimation;
  late Animation<Offset> _slideAnimation;

  late UserStory _currentUserStory;
  int _currentUserIndex = 0;
  int _currentStoryIndex = 0;
  bool _isPaused = false;

  @override
  void initState() {
    super.initState();
    _initializeData();
    _initializeAnimations();
    _startStory();
  }

  @override
  void dispose() {
    _progressController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  void _initializeData() {
    _currentUserStory = widget.initialUserStory;
    _currentUserIndex = widget.allUserStories.indexOf(widget.initialUserStory);
  }

  void _initializeAnimations() {
    _progressController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    
    _progressAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _progressController,
      curve: Curves.linear,
    ));

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.0),
      end: const Offset(-1.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeInOut,
    ));

    _progressController.addStatusListener((status) {
      if (status == AnimationStatus.completed && !_isPaused) {
        _nextStory();
      }
    });
  }

  void _startStory() {
    _progressController.reset();
    _progressController.forward();
  }

  void _pauseStory() {
    if (!_isPaused) {
      setState(() {
        _isPaused = true;
      });
      _progressController.stop();
    }
  }

  void _resumeStory() {
    if (_isPaused) {
      setState(() {
        _isPaused = false;
      });
      _progressController.forward();
    }
  }

  void _nextStory() {
    if (_currentStoryIndex < _currentUserStory.stories.length - 1) {
      setState(() {
        _currentStoryIndex++;
      });
      _startStory();
    } else {
      _nextUser();
    }
  }

  void _previousStory() {
    if (_currentStoryIndex > 0) {
      setState(() {
        _currentStoryIndex--;
      });
      _startStory();
    } else {
      _previousUser();
    }
  }

  void _nextUser() {
    if (_currentUserIndex < widget.allUserStories.length - 1) {
      _slideController.forward().then((_) {
        setState(() {
          _currentUserIndex++;
          _currentUserStory = widget.allUserStories[_currentUserIndex];
          _currentStoryIndex = 0;
        });
        _slideController.reset();
        _startStory();
      });
    } else {
      Navigator.of(context).pop();
    }
  }

  void _previousUser() {
    if (_currentUserIndex > 0) {
      _slideController.forward().then((_) {
        setState(() {
          _currentUserIndex--;
          _currentUserStory = widget.allUserStories[_currentUserIndex];
          _currentStoryIndex = _currentUserStory.stories.length - 1;
        });
        _slideController.reset();
        _startStory();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Story content with slide transition
          StoryContent(
            story: _currentUserStory.stories[_currentStoryIndex],
            slideAnimation: _slideAnimation,
          ),
          
          // Tap zones for interaction (placed early so header can override)
          StoryTapZones(
            onTapZone: (zone) {
              switch (zone) {
                case TapZone.previous:
                  _previousStory();
                  break;
                case TapZone.next:
                  _nextStory();
                  break;
                case TapZone.pause:
                  // This is now handled by long press in tap zones
                  break;
              }
            },
            onPauseStart: () => _pauseStory(),
            onPauseEnd: () => _resumeStory(),
          ),
          
          // Progress indicators
          AnimatedBuilder(
            animation: _progressAnimation,
            builder: (context, child) {
              return StoryProgressIndicators(
                stories: _currentUserStory.stories,
                currentStoryIndex: _currentStoryIndex,
                progressAnimation: _progressAnimation,
              );
            },
          ),
          
          // Header (placed last so close button works)
          StoryHeader(
            userStory: _currentUserStory,
            currentStory: _currentUserStory.stories[_currentStoryIndex],
            onClose: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
