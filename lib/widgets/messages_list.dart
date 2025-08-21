import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../models/chat_models.dart';
import 'whatsapp_message_bubble.dart';

class MessagesList extends StatelessWidget {
  final ScrollController scrollController;
  final List<ChatMessage> messages;

  const MessagesList({
    super.key,
    required this.scrollController,
    required this.messages,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];
          return FadeInUp(
            duration: Duration(milliseconds: 200 + (index * 50)),
            child: WhatsAppMessageBubble(message: message),
          );
        },
      ),
    );
  }
}
