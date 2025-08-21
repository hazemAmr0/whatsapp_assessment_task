class ChatMessage {
  final String id;
  final String senderId;
  final String senderName;
  final String content;
  final DateTime timestamp;
  final bool isMe;
  final MessageType type;
  final MessageStatus status;

  ChatMessage({
    required this.id,
    required this.senderId,
    required this.senderName,
    required this.content,
    required this.timestamp,
    required this.isMe,
    this.type = MessageType.text,
    this.status = MessageStatus.sent,
  });
}

enum MessageType {
  text,
  image,
  voice,
  video,
  document,
}

enum MessageStatus {
  sending,
  sent,
  delivered,
  read,
}

class Chat {
  final String id;
  final String name;
  final String? avatar;
  final String lastMessage;
  final DateTime lastMessageTime;
  final int unreadCount;
  final bool isOnline;
  final bool isTyping;
  final bool isPinned;
  final bool isMuted;
  final List<ChatMessage> messages;

  Chat({
    required this.id,
    required this.name,
    this.avatar,
    required this.lastMessage,
    required this.lastMessageTime,
    this.unreadCount = 0,
    this.isOnline = false,
    this.isTyping = false,
    this.isPinned = false,
    this.isMuted = false,
    this.messages = const [],
  });
}

class Story {
  final String id;
  final String userId;
  final String userName;
  final String? userAvatar;
  final String mediaUrl;
  final StoryType type;
  final DateTime timestamp;
  final bool isViewed;
  final bool isMyStory;

  Story({
    required this.id,
    required this.userId,
    required this.userName,
    this.userAvatar,
    required this.mediaUrl,
    required this.type,
    required this.timestamp,
    this.isViewed = false,
    this.isMyStory = false,
  });
}

class UserStory {
  final String userId;
  final String userName;
  final String? userAvatar;
  final List<Story> stories;
  final bool isMyStory;

  UserStory({
    required this.userId,
    required this.userName,
    this.userAvatar,
    required this.stories,
    this.isMyStory = false,
  });

  bool get hasUnviewedStories => stories.any((story) => !story.isViewed);
  int get unviewedCount => stories.where((story) => !story.isViewed).length;
  int get totalCount => stories.length;
  DateTime get latestTimestamp => stories.map((s) => s.timestamp).reduce((a, b) => a.isAfter(b) ? a : b);
}

enum StoryType {
  image,
  video,
  text,
}

class User {
  final String id;
  final String name;
  final String? avatar;
  final String? status;
  final bool isOnline;
  final DateTime? lastSeen;

  User({
    required this.id,
    required this.name,
    this.avatar,
    this.status,
    this.isOnline = false,
    this.lastSeen,
  });
}
