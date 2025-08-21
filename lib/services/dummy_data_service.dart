import '../models/chat_models.dart';

class DummyDataService {
  static List<Chat> getChats() {
    final now = DateTime.now();
    return [
      Chat(
        id: '1',
        name: 'John Doe',
        avatar: 'assets/images/profile1.jpg',
        lastMessage: 'Hey! How are you doing today?',
        lastMessageTime: now.subtract(const Duration(minutes: 5)),
        unreadCount: 2,
        isOnline: true,
        isPinned: true,
        messages: [
          ChatMessage(
            id: 'm1',
            senderId: '1',
            senderName: 'John Doe',
            content: 'Hey there!',
            timestamp: now.subtract(const Duration(minutes: 10)),
            isMe: false,
            status: MessageStatus.read,
          ),
          ChatMessage(
            id: 'm2',
            senderId: 'me',
            senderName: 'Me',
            content: 'Hi John! How are you?',
            timestamp: now.subtract(const Duration(minutes: 8)),
            isMe: true,
            status: MessageStatus.read,
          ),
          ChatMessage(
            id: 'm3',
            senderId: '1',
            senderName: 'John Doe',
            content: 'Hey! How are you doing today?',
            timestamp: now.subtract(const Duration(minutes: 5)),
            isMe: false,
            status: MessageStatus.delivered,
          ),
        ],
      ),
      Chat(
        id: '2',
        name: 'Sarah Wilson',
        avatar: 'assets/images/profile2.jpg',
        lastMessage: 'Can we meet tomorrow?',
        lastMessageTime: now.subtract(const Duration(hours: 1)),
        unreadCount: 0,
        isOnline: false,
        messages: [
          ChatMessage(
            id: 'm4',
            senderId: '2',
            senderName: 'Sarah Wilson',
            content: 'Can we meet tomorrow?',
            timestamp: now.subtract(const Duration(hours: 1)),
            isMe: false,
            status: MessageStatus.read,
          ),
        ],
      ),
      Chat(
        id: '3',
        name: 'Work Team',
        avatar: 'assets/images/profile3.jpg',
        lastMessage: 'Meeting at 3 PM today',
        lastMessageTime: now.subtract(const Duration(hours: 2)),
        unreadCount: 5,
        isOnline: false,
        isMuted: true,
        messages: [
          ChatMessage(
            id: 'm5',
            senderId: '3',
            senderName: 'Work Team',
            content: 'Meeting at 3 PM today',
            timestamp: now.subtract(const Duration(hours: 2)),
            isMe: false,
            status: MessageStatus.delivered,
          ),
        ],
      ),
      Chat(
        id: '4',
        name: 'Mike Johnson',
        avatar: 'assets/images/profile4.jpg',
        lastMessage: 'Thanks for the help!',
        lastMessageTime: now.subtract(const Duration(hours: 5)),
        unreadCount: 0,
        isOnline: true,
        messages: [
          ChatMessage(
            id: 'm6',
            senderId: '4',
            senderName: 'Mike Johnson',
            content: 'Thanks for the help!',
            timestamp: now.subtract(const Duration(hours: 5)),
            isMe: false,
            status: MessageStatus.read,
          ),
        ],
      ),
      Chat(
        id: '5',
        name: 'Emma Davis',
        avatar: 'assets/images/profile5.jpg',
        lastMessage: 'See you later! 👋',
        lastMessageTime: now.subtract(const Duration(days: 1)),
        unreadCount: 0,
        isOnline: false,
        messages: [
          ChatMessage(
            id: 'm7',
            senderId: '5',
            senderName: 'Emma Davis',
            content: 'See you later! 👋',
            timestamp: now.subtract(const Duration(days: 1)),
            isMe: false,
            status: MessageStatus.read,
          ),
        ],
      ),
      Chat(
        id: '6',
        name: 'Family Group',
        avatar: 'assets/images/profile6.jpg',
        lastMessage: 'Mom: Don\'t forget dinner tomorrow',
        lastMessageTime: now.subtract(const Duration(days: 1)),
        unreadCount: 3,
        isOnline: false,
        isPinned: true,
        messages: [
          ChatMessage(
            id: 'm8',
            senderId: 'mom',
            senderName: 'Mom',
            content: 'Don\'t forget dinner tomorrow',
            timestamp: now.subtract(const Duration(days: 1)),
            isMe: false,
            status: MessageStatus.delivered,
          ),
       
        ],
        
      ),
      Chat(
        id: '7',
        name: 'marwan pablo',
        avatar: 'assets/images/profile7.jpg',
        lastMessage: 'aywa ya zmelly',
        lastMessageTime: now.subtract(const Duration(days: 1)),
        unreadCount: 3,
        isOnline: false,
        isPinned: false,
        messages: [
          ChatMessage(
            id: 'm8',
            senderId: 'mom',
            senderName: 'Mom',
            content: 'Don\'t forget dinner tomorrow',
            timestamp: now.subtract(const Duration(days: 1)),
            isMe: false,
            status: MessageStatus.delivered,
          ),

        ],
      ),


    ];
  }

  static List<UserStory> getUserStories() {
    final now = DateTime.now();
    return [
      // My Status with 2 stories
      UserStory(
        userId: 'me',
        userName: 'My Status',
        userAvatar: 'assets/images/profile7.jpg',
        isMyStory: true,
        stories: [
          Story(
            id: 'my_story_1',
            userId: 'me',
            userName: 'My Status',
            userAvatar: 'assets/images/profile7.jpg',
            mediaUrl: 'assets/images/story1.jpg',
            type: StoryType.image,
            timestamp: now.subtract(const Duration(hours: 2)),
            isMyStory: true,
            isViewed: true,
          ),
          Story(
            id: 'my_story_2',
            userId: 'me',
            userName: 'My Status',
            userAvatar: 'assets/images/profile7.jpg',
            mediaUrl: 'assets/images/story2.jpg',
            type: StoryType.image,
            timestamp: now.subtract(const Duration(hours: 1)),
            isMyStory: true,
            isViewed: true,
          ),
        ],
      ),
      
      // John Doe with 3 stories
      UserStory(
        userId: '1',
        userName: 'John Doe',
        userAvatar: 'assets/images/profile1.jpg',
        stories: [
          Story(
            id: 's1_1',
            userId: '1',
            userName: 'John Doe',
            userAvatar: 'assets/images/profile1.jpg',
            mediaUrl: 'assets/images/story3.jpg',
            type: StoryType.image,
            timestamp: now.subtract(const Duration(hours: 1)),
            isViewed: false,
          ),
          Story(
            id: 's1_2',
            userId: '1',
            userName: 'John Doe',
            userAvatar: 'assets/images/profile1.jpg',
            mediaUrl: 'assets/images/story4.jpg',
            type: StoryType.image,
            timestamp: now.subtract(const Duration(minutes: 45)),
            isViewed: false,
          ),
          Story(
            id: 's1_3',
            userId: '1',
            userName: 'John Doe',
            userAvatar: 'assets/images/profile1.jpg',
            mediaUrl: 'assets/images/story5.jpg',
            type: StoryType.image,
            timestamp: now.subtract(const Duration(minutes: 30)),
            isViewed: false,
          ),
        ],
      ),
      
      // Sarah Wilson with 1 story (viewed)
      UserStory(
        userId: '2',
        userName: 'Sarah Wilson',
        userAvatar: 'assets/images/profile2.jpg',
        stories: [
          Story(
            id: 's2_1',
            userId: '2',
            userName: 'Sarah Wilson',
            userAvatar: 'assets/images/profile2.jpg',
            mediaUrl: 'assets/images/story1.jpg',
            type: StoryType.image,
            timestamp: now.subtract(const Duration(hours: 3)),
            isViewed: true,
          ),
        ],
      ),
      
      // Emily Chen with 2 stories (viewed)
      UserStory(
        userId: '3',
        userName: 'Emily Chen',
        userAvatar: 'assets/images/profile3.jpg',
        stories: [
          Story(
            id: 's3_1',
            userId: '3',
            userName: 'Emily Chen',
            userAvatar: 'assets/images/profile3.jpg',
            mediaUrl: 'assets/images/story4.jpg',
            type: StoryType.image,
            timestamp: now.subtract(const Duration(hours: 6)),
            isViewed: true,
          ),
          Story(
            id: 's3_2',
            userId: '3',
            userName: 'Emily Chen',
            userAvatar: 'assets/images/profile3.jpg',
            mediaUrl: 'assets/images/story5.jpg',
            type: StoryType.image,
            timestamp: now.subtract(const Duration(hours: 5)),
            isViewed: true,
          ),
        ],
      ),
      
      // Mike Johnson with 2 stories (unviewed)
      UserStory(
        userId: '4',
        userName: 'Mike Johnson',
        userAvatar: 'assets/images/profile4.jpg',
        stories: [
          Story(
            id: 's4_1',
            userId: '4',
            userName: 'Mike Johnson',
            userAvatar: 'assets/images/profile4.jpg',
            mediaUrl: 'assets/images/story2.jpg',
            type: StoryType.image,
            timestamp: now.subtract(const Duration(hours: 2)),
            isViewed: false,
          ),
          Story(
            id: 's4_2',
            userId: '4',
            userName: 'Mike Johnson',
            userAvatar: 'assets/images/profile4.jpg',
            mediaUrl: 'assets/images/story3.jpg',
            type: StoryType.image,
            timestamp: now.subtract(const Duration(hours: 1)),
            isViewed: false,
          ),
        ],
      ),
      
      // David Brown with 1 story (viewed)
      UserStory(
        userId: '5',
        userName: 'David Brown',
        userAvatar: 'assets/images/profile5.jpg',
        stories: [
          Story(
            id: 's5_1',
            userId: '5',
            userName: 'David Brown',
            userAvatar: 'assets/images/profile5.jpg',
            mediaUrl: 'assets/images/story1.jpg',
            type: StoryType.image,
            timestamp: now.subtract(const Duration(hours: 8)),
            isViewed: true,
          ),
        ],
      ),
    ];
  }

  static List<Story> getStories() {
    final userStories = getUserStories();
    List<Story> allStories = [];
    for (var userStory in userStories) {
      allStories.addAll(userStory.stories);
    }
    return allStories;
  }

  static List<ChatMessage> getChatMessages(String chatId) {
    final chats = getChats();
    final chat = chats.firstWhere((c) => c.id == chatId);
    return chat.messages;
  }

  static List<ChatMessage> getExtendedChatMessages(String chatId) {
    final now = DateTime.now();
    
    // Return extended messages for demo
    return [
      ChatMessage(
        id: 'm1',
        senderId: chatId,
        senderName: 'Contact',
        content: 'Hey there! How are you doing today?',
        timestamp: now.subtract(const Duration(hours: 2)),
        isMe: false,
        status: MessageStatus.read,
      ),
      ChatMessage(
        id: 'm2',
        senderId: 'me',
        senderName: 'Me',
        content: 'Hi! I\'m doing great, thanks for asking 😊',
        timestamp: now.subtract(const Duration(hours: 2, minutes: 5)),
        isMe: true,
        status: MessageStatus.read,
      ),
      ChatMessage(
        id: 'm3',
        senderId: chatId,
        senderName: 'Contact',
        content: 'That\'s awesome! Want to catch up later?',
        timestamp: now.subtract(const Duration(hours: 1, minutes: 45)),
        isMe: false,
        status: MessageStatus.read,
      ),
      ChatMessage(
        id: 'm4',
        senderId: 'me',
        senderName: 'Me',
        content: 'Sure! What time works for you?',
        timestamp: now.subtract(const Duration(hours: 1, minutes: 40)),
        isMe: true,
        status: MessageStatus.read,
      ),
      ChatMessage(
        id: 'm5',
        senderId: chatId,
        senderName: 'Contact',
        content: 'How about 6 PM? We can meet at the coffee shop',
        timestamp: now.subtract(const Duration(hours: 1, minutes: 35)),
        isMe: false,
        status: MessageStatus.read,
      ),
      ChatMessage(
        id: 'm6',
        senderId: 'me',
        senderName: 'Me',
        content: 'Perfect! See you there 👍',
        timestamp: now.subtract(const Duration(hours: 1, minutes: 30)),
        isMe: true,
        status: MessageStatus.delivered,
      ),
      ChatMessage(
        id: 'm7',
        senderId: chatId,
        senderName: 'Contact',
        content: 'Great! Looking forward to it',
        timestamp: now.subtract(const Duration(minutes: 5)),
        isMe: false,
        status: MessageStatus.sent,
      ),
    ];
  }
}
