import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class ChatInput extends StatelessWidget {
  final TextEditingController messageController;
  final bool hasText;
  final bool isDarkMode;
  final VoidCallback? onSendMessage;
  final VoidCallback? onEmojiPressed;
  final VoidCallback? onAttachmentPressed;
  final VoidCallback? onCameraPressed;
  final VoidCallback? onMicPressed;

  const ChatInput({
    super.key,
    required this.messageController,
    required this.hasText,
    required this.isDarkMode,
    this.onSendMessage,
    this.onEmojiPressed,
    this.onAttachmentPressed,
    this.onCameraPressed,
    this.onMicPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      color: isDarkMode ? Colors.transparent : Colors.transparent,
      child: Row(
        children: [
          // Text input container
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: isDarkMode ? const Color(0xFF2A3942) : Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: isDarkMode 
                    ? Colors.transparent 
                    : Colors.grey.shade300,
                ),
              ),
              child: Row(
                children: [
                  // Emoji button
                  IconButton(
                    icon: Icon(
                      Icons.emoji_emotions_outlined,
                      color: isDarkMode ? Colors.grey.shade400 : Colors.grey.shade600,
                    ),
                    onPressed: onEmojiPressed,
                  ),
                  
                  // Text field
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                        hintText: 'Message',
                        hintStyle: TextStyle(
                          color: isDarkMode ? Colors.grey.shade400 : Colors.grey.shade600,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      ),
                      style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                      maxLines: null,
                      textCapitalization: TextCapitalization.sentences,
                    ),
                  ),
                  
                  // Attachment button
                  IconButton(
                    icon: Transform.rotate(
                      angle: -0.5,
                      child: Icon(
                        Icons.attach_file,
                        color: isDarkMode ? Colors.grey.shade400 : Colors.grey.shade600,
                      ),
                    ),
                    onPressed: onAttachmentPressed,
                  ),
                  
                  // Camera button
                  IconButton(
                    icon: Icon(
                      Icons.camera_alt,
                      color: isDarkMode ? Colors.grey.shade400 : Colors.grey.shade600,
                    ),
                    onPressed: onCameraPressed,
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(width: 8),
          
          // Send/Mic button
          Container(
            decoration: const BoxDecoration(
              color: AppColors.primaryDark,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(
                hasText ? Icons.send : Icons.mic,
                color: Colors.white,
                size: 20,
              ),
              onPressed: hasText ? onSendMessage : onMicPressed,
            ),
          ),
        ],
      ),
    );
  }
}
