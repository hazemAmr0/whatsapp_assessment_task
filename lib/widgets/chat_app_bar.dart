import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/responsive_utils.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String chatName;
  final String? chatAvatar;
  final bool isOnline;
  final VoidCallback? onVideoCall;
  final VoidCallback? onVoiceCall;
  final VoidCallback? onMoreOptions;

  const ChatAppBar({
    super.key,
    required this.chatName,
    this.chatAvatar,
    this.isOnline = false,
    this.onVideoCall,
    this.onVoiceCall,
    this.onMoreOptions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryDark,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Row(
        children: [
          // Avatar
          CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.primaryLight,
            backgroundImage: chatAvatar != null && chatAvatar!.isNotEmpty
                ? AssetImage(chatAvatar!)
                : null,
            child: chatAvatar == null || chatAvatar!.isEmpty
                ? const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 20,
                  )
                : null,
          ),
          
          SizedBox(width: ResponsiveUtils.smallSpacing),
          
          // Name and status
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chatName,
                  style: TextStyle(
                    fontSize: ResponsiveUtils.mediumText,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (isOnline)
                  Text(
                    'online',
                    style: TextStyle(
                      fontSize: ResponsiveUtils.smallText - 2,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.videocam, color: Colors.white),
          onPressed: onVideoCall,
        ),
        IconButton(
          icon: const Icon(Icons.call, color: Colors.white),
          onPressed: onVoiceCall,
        ),
        IconButton(
          icon: const Icon(Icons.more_vert, color: Colors.white),
          onPressed: onMoreOptions,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
