import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../models/chat_models.dart';
import '../services/dummy_data_service.dart';
import '../utils/app_colors.dart';
import '../utils/responsive_utils.dart';
import '../screens/chat_screen.dart';

class ChatListTab extends StatefulWidget {
  const ChatListTab({super.key});

  @override
  State<ChatListTab> createState() => _ChatListTabState();
}

class _ChatListTabState extends State<ChatListTab> {
  List<Chat> chats = [];

  @override
  void initState() {
    super.initState();
    _loadChats();
  }

  void _loadChats() {
    setState(() {
      chats = DummyDataService.getChats();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return FadeInUp(
          duration: Duration(milliseconds: 300 + (index * 100)),
          child: ChatListItem(
            chat: chat,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ChatScreen(
                    chatId: chat.id,
                    chatName: chat.name,
                    chatAvatar: chat.avatar,
                    isOnline: chat.isOnline,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class ChatListItem extends StatelessWidget {
  final Chat chat;
  final VoidCallback onTap;

  const ChatListItem({
    super.key,
    required this.chat,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(minHeight: ResponsiveUtils.chatItemHeight),
        padding: ResponsiveUtils.mediumPadding,
        child: Row(
          children: [
            // Avatar
            Stack(
              children: [
                CircleAvatar(
                  radius: ResponsiveUtils.normalAvatar / 2,
                  backgroundColor: AppColors.primaryLight,
                  backgroundImage: chat.avatar != null
                      ? AssetImage(chat.avatar!)
                      : null,
                  child: chat.avatar == null
                      ? Icon(
                          Icons.person,
                          color: Colors.white,
                          size: ResponsiveUtils.mediumIcon,
                        )
                      : null,
                ),
                
                // Online indicator
                if (chat.isOnline)
                  Positioned(
                    bottom: 0,
                    right: 2,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: theme.scaffoldBackgroundColor,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            
            SizedBox(width: ResponsiveUtils.mediumSpacing),
            
            // Chat info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      // Pinned icon
                      if (chat.isPinned)
                        Padding(
                          padding: EdgeInsets.only(right: ResponsiveUtils.verySmallSpacing),
                          child: Icon(
                            Icons.push_pin,
                            size: ResponsiveUtils.smallIcon,
                            color: theme.colorScheme.secondary,
                          ),
                        ),
                      
                      // Chat name
                      Expanded(
                        child: Text(
                          chat.name,
                          style: TextStyle(
                            fontSize: ResponsiveUtils.mediumText,
                            fontWeight: FontWeight.w600,
                            color: theme.textTheme.bodyLarge?.color,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      
                      // Time and mute icon
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _formatTime(chat.lastMessageTime),
                            style: TextStyle(
                              fontSize: ResponsiveUtils.smallText,
                              color: chat.unreadCount > 0
                                  ? AppColors.primaryLight
                                  : theme.textTheme.bodySmall?.color,
                              fontWeight: chat.unreadCount > 0
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                            ),
                          ),
                          if (chat.isMuted)
                            Padding(
                              padding: EdgeInsets.only(left: ResponsiveUtils.verySmallSpacing),
                              child: Icon(
                                Icons.volume_off,
                                size: ResponsiveUtils.smallIcon,
                                color: theme.textTheme.bodySmall?.color,
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                  
                  SizedBox(height: ResponsiveUtils.verySmallSpacing),
                  
                  Row(
                    children: [
                      // Last message
                      Expanded(
                        child: Text(
                          chat.lastMessage,
                          style: TextStyle(
                            fontSize: ResponsiveUtils.normalText,
                            color: theme.textTheme.bodyMedium?.color,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      
                      // Unread count badge
                      if (chat.unreadCount > 0)
                        Container(
                          constraints: const BoxConstraints(minWidth: 16),
                          height: 16,
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          decoration: BoxDecoration(
                            color: chat.isMuted
                                ? theme.textTheme.bodySmall?.color
                                : AppColors.primaryLight,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              chat.unreadCount > 99 ? '99+' : chat.unreadCount.toString(),
                              style: TextStyle(
                                fontSize: ResponsiveUtils.verySmallText,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                    ],
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

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d';
    } else {
      return '${time.day}/${time.month}';
    }
  }
}
