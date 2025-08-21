import 'package:flutter/material.dart';
import '../models/chat_models.dart';
import '../widgets/chat_app_bar.dart';
import '../widgets/chat_input.dart';
import '../widgets/chat_background.dart';
import '../widgets/messages_list.dart';
import '../widgets/chat_message_handler.dart';

class ChatScreen extends StatefulWidget {
  final String chatId;
  final String chatName;
  final String? chatAvatar;
  final bool isOnline;

  const ChatScreen({
    super.key,
    required this.chatId,
    required this.chatName,
    this.chatAvatar,
    this.isOnline = false,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ChatMessageHandlerState> _messageHandlerKey = 
      GlobalKey<ChatMessageHandlerState>();
  
  List<ChatMessage> messages = [];
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _messageController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _hasText = _messageController.text.trim().isNotEmpty;
    });
  }

  void _onMessagesChanged(List<ChatMessage> newMessages) {
    setState(() {
      messages = newMessages;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void _sendMessage() {
    if (_hasText) {
      final content = _messageController.text;
      _messageController.clear();
      _messageHandlerKey.currentState?.sendMessage(content);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      appBar: ChatAppBar(
        chatName: widget.chatName,
        chatAvatar: widget.chatAvatar,
        isOnline: widget.isOnline,
      ),
      body: ChatBackground(
        isDarkMode: isDarkMode,
        child: Column(
          children: [
            // Messages list
            Expanded(
              child: messages.isEmpty 
                ? const Center(
                    child: Text(
                      'No messages yet',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  )
                : MessagesList(
                    scrollController: _scrollController,
                    messages: messages,
                  ),
            ),
            
            // Input field
            ChatInput(
              messageController: _messageController,
              hasText: _hasText,
              isDarkMode: isDarkMode,
              onSendMessage: _sendMessage,
            ),
          ],
        ),
      ),
      // Message handler (invisible but manages data)
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: Opacity(
        opacity: 0.0,
        child: ChatMessageHandler(
          key: _messageHandlerKey,
          chatId: widget.chatId,
          onMessagesChanged: _onMessagesChanged,
        ),
      ),
    );
  }
}

