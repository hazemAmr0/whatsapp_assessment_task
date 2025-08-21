import 'package:flutter/material.dart';
import '../models/chat_models.dart';

class WhatsAppMessageBubble extends StatelessWidget {
  final ChatMessage message;

  const WhatsAppMessageBubble({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      margin: EdgeInsets.only(
        top: 4,
        bottom: 4,
        left: message.isMe ? 64 : 8,
        right: message.isMe ? 8 : 64,
      ),
      child: Align(
        alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: message.isMe
                ? (isDarkMode ? const Color(0xFF005C4B) : const Color(0xFFDCF8C6))
                : (isDarkMode ? const Color(0xFF262D31) : Colors.white),
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(12),
              topRight: const Radius.circular(12),
              bottomLeft: Radius.circular(message.isMe ? 12 : 4),
              bottomRight: Radius.circular(message.isMe ? 4 : 12),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Message content
              Text(
                message.content,
                style: TextStyle(
                  fontSize: 16,
                  color: message.isMe
                      ? (isDarkMode ? Colors.white : Colors.black87)
                      : (isDarkMode ? Colors.white : Colors.black87),
                ),
              ),
              
              const SizedBox(height: 4),
              
              // Time and status
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _formatTime(message.timestamp),
                    style: TextStyle(
                      fontSize: 12,
                      color: message.isMe
                          ? (isDarkMode ? Colors.white.withOpacity(0.7) : Colors.black54)
                          : (isDarkMode ? Colors.white.withOpacity(0.7) : Colors.grey.shade600),
                    ),
                  ),
                  
                  if (message.isMe) ...[
                    const SizedBox(width: 4),
                    Icon(
                      _getStatusIcon(message.status),
                      size: 16,
                      color: isDarkMode ? Colors.white.withOpacity(0.7) : Colors.black54,
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    } else {
      final hour = dateTime.hour;
      final minute = dateTime.minute.toString().padLeft(2, '0');
      final period = hour >= 12 ? 'PM' : 'AM';
      final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
      return '$displayHour:$minute $period';
    }
  }

  IconData _getStatusIcon(MessageStatus status) {
    switch (status) {
      case MessageStatus.sending:
        return Icons.access_time;
      case MessageStatus.sent:
        return Icons.done;
      case MessageStatus.delivered:
        return Icons.done_all;
      case MessageStatus.read:
        return Icons.done_all;
    }
  }
}