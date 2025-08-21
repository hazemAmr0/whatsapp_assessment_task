import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../models/chat_models.dart';
import '../services/dummy_data_service.dart';
import '../utils/app_colors.dart';
import '../utils/responsive_utils.dart';
import '../screens/stories_screen.dart';
import '../widgets/whatsapp_story_ring.dart';

class StoriesTab extends StatefulWidget {
  const StoriesTab({super.key});

  @override
  State<StoriesTab> createState() => _StoriesTabState();
}

class _StoriesTabState extends State<StoriesTab> {
  List<UserStory> userStories = [];

  @override
  void initState() {
    super.initState();
    _loadStories();
  }

  void _loadStories() {
    setState(() {
      userStories = DummyDataService.getUserStories();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Safe way to get myStory with fallback
    UserStory? myStoryNullable;
    try {
      myStoryNullable = userStories.firstWhere((story) => story.isMyStory);
    } catch (e) {
      // Create a default "My Status" if none exists
      myStoryNullable = UserStory(
        userId: 'me',
        userName: 'My Status',
        userAvatar: 'assets/images/profile7.jpg',
        isMyStory: true,
        stories: [],
      );
    }
    final myStory = myStoryNullable;
    final otherStories = userStories.where((story) => !story.isMyStory).toList();
    
    // Separate stories into recent updates (unviewed) and viewed updates
    final recentUpdates = otherStories.where((story) => story.hasUnviewedStories).toList();
    final viewedUpdates = otherStories.where((story) => !story.hasUnviewedStories).toList();

    return Column(
      children: [
        // My Status Section
        FadeInDown(
          duration: const Duration(milliseconds: 600),
          child: Container(
            padding: ResponsiveUtils.mediumPadding,
            child: Row(
              children: [
                // My status avatar with WhatsApp-style story ring
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StoriesScreen(
                          initialUserStory: myStory,
                          allUserStories: userStories,
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      WhatsAppStoryRing(
                        size: 70,
                        storyCount: myStory.totalCount,
                        hasUnviewed: myStory.hasUnviewedStories,
                        child: CircleAvatar(
                          radius: 32,
                          backgroundColor: AppColors.primaryLight,
                          backgroundImage: myStory.userAvatar != null
                              ? AssetImage(myStory.userAvatar!)
                              : null,
                          child: myStory.userAvatar == null
                              ? const Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 28,
                                )
                              : null,
                        ),
                      ),
                      
                      // Add status button
                      Positioned(
                        bottom: 2,
                        right: 2,
                        child: Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            color: AppColors.primaryDark,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              width: 2,
                            ),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                SizedBox(width: ResponsiveUtils.mediumSpacing),
                
                // My status info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Status',
                        style: TextStyle(
                          fontSize: ResponsiveUtils.mediumText,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: ResponsiveUtils.verySmallSpacing),
                      Text(
                        'Tap to add status update',
                        style: TextStyle(
                          fontSize: ResponsiveUtils.normalText,
                          color: Theme.of(context).textTheme.bodyMedium?.color,
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Camera button
                IconButton(
                  icon: Icon(
                    Icons.camera_alt,
                    color: Theme.of(context).iconTheme.color,
                    size: ResponsiveUtils.mediumIcon,
                  ),
                  onPressed: () {
                    // TODO: Open camera for status
                  },
                ),
                
                // Edit button
                IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Theme.of(context).iconTheme.color,
                    size: ResponsiveUtils.mediumIcon,
                  ),
                  onPressed: () {
                    // TODO: Edit status
                  },
                ),
              ],
            ),
          ),
        ),
        
        // Content area with scroll view
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Recent updates section
                if (recentUpdates.isNotEmpty) ...[
                  const Divider(),
                  Container(
                    padding: ResponsiveUtils.mediumPadding,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Recent updates',
                      style: TextStyle(
                        fontSize: ResponsiveUtils.normalText,
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  
                  // Recent updates list
                  ...recentUpdates.asMap().entries.map((entry) {
                    final index = entry.key;
                    final userStory = entry.value;
                    return FadeInUp(
                      duration: Duration(milliseconds: 300 + (index * 100)),
                      child: UserStoryListItem(
                        userStory: userStory, 
                        allUserStories: userStories
                      ),
                    );
                  }).toList(),
                ],
                
                // Viewed updates section
                if (viewedUpdates.isNotEmpty) ...[
                  const Divider(),
                  Container(
                    padding: ResponsiveUtils.mediumPadding,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Viewed updates',
                      style: TextStyle(
                        fontSize: ResponsiveUtils.normalText,
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  
                  // Viewed updates list
                  ...viewedUpdates.asMap().entries.map((entry) {
                    final index = entry.key;
                    final userStory = entry.value;
                    return FadeInUp(
                      duration: Duration(milliseconds: 300 + ((recentUpdates.length + index) * 100)),
                      child: UserStoryListItem(
                        userStory: userStory, 
                        allUserStories: userStories
                      ),
                    );
                  }).toList(),
                ],
                
                // Empty state
                if (recentUpdates.isEmpty && viewedUpdates.isEmpty)
                  Container(
                    padding: ResponsiveUtils.largePadding,
                    child: Center(
                      child: Text(
                        'No status updates yet',
                        style: TextStyle(
                          fontSize: ResponsiveUtils.mediumText,
                          color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.6),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class UserStoryListItem extends StatelessWidget {
  final UserStory userStory;
  final List<UserStory> allUserStories;

  const UserStoryListItem({
    super.key,
    required this.userStory,
    required this.allUserStories,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StoriesScreen(
              initialUserStory: userStory,
              allUserStories: allUserStories,
            ),
          ),
        );
      },
      child: Container(
        padding: ResponsiveUtils.mediumPadding,
        child: Row(
          children: [
            // User avatar with WhatsApp-style story ring
            WhatsAppStoryRing(
              size: 64,
              storyCount: userStory.totalCount,
              hasUnviewed: userStory.hasUnviewedStories,
              child: CircleAvatar(
                radius: 28,
                backgroundColor: AppColors.primaryLight,
                backgroundImage: userStory.userAvatar != null
                    ? AssetImage(userStory.userAvatar!)
                    : null,
                child: userStory.userAvatar == null
                    ? const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 24,
                      )
                    : null,
              ),
            ),
            
            SizedBox(width: ResponsiveUtils.mediumSpacing),
            
            // User info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userStory.userName,
                    style: TextStyle(
                      fontSize: ResponsiveUtils.mediumText,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: ResponsiveUtils.verySmallSpacing),
                  Text(
                    _formatTime(userStory.latestTimestamp),
                    style: TextStyle(
                      fontSize: ResponsiveUtils.normalText,
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final difference = now.difference(time);

    if (difference.inDays > 0) {
      if (difference.inDays == 1) {
        return 'Yesterday';
      } else {
        return '${difference.inDays} days ago';
      }
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h';
    } else {
      return '${difference.inMinutes}m';
    }
  }
}
