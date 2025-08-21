import 'package:flutter/material.dart';
import '../models/chat_models.dart';
import '../services/dummy_data_service.dart';

class ChatMessageHandler extends StatefulWidget {
  final String chatId;
  final Function(List<ChatMessage>) onMessagesChanged;

  const ChatMessageHandler({
    super.key,
    required this.chatId,
    required this.onMessagesChanged,
  });

  @override
  State<ChatMessageHandler> createState() => ChatMessageHandlerState();
}

class ChatMessageHandlerState extends State<ChatMessageHandler> {
  List<ChatMessage> messages = [];

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  void _loadMessages() {
    final loadedMessages = DummyDataService.getExtendedChatMessages(widget.chatId);
    setState(() {
      messages = loadedMessages;
    });
    // Ensure the callback is called after the widget is fully built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onMessagesChanged(messages);
    });
  }

  void sendMessage(String content) {
    if (content.trim().isEmpty) return;

    final newMessage = ChatMessage(
      id: 'new_${DateTime.now().millisecondsSinceEpoch}',
      senderId: 'me',
      senderName: 'Me',
      content: content.trim(),
      timestamp: DateTime.now(),
      isMe: true,
      status: MessageStatus.sending,
    );

    setState(() {
      messages.add(newMessage);
    });
    widget.onMessagesChanged(messages);

    // Simulate message being sent
    _simulateMessageDelivery(newMessage);
  }

  void _simulateMessageDelivery(ChatMessage message) {
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          final index = messages.indexWhere((m) => m.id == message.id);
          if (index != -1) {
            messages[index] = ChatMessage(
              id: message.id,
              senderId: message.senderId,
              senderName: message.senderName,
              content: message.content,
              timestamp: message.timestamp,
              isMe: message.isMe,
              status: MessageStatus.delivered,
            );
          }
        });
        widget.onMessagesChanged(messages);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink(); // This is a data handler widget
  }
}
