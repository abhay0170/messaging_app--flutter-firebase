import 'package:flutter/material.dart';

class ChatBubbles extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  const ChatBubbles({
    super.key,
    required this.message,
    required this.isCurrentUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      decoration: BoxDecoration(
        color: isCurrentUser ? Colors.green : Colors.grey.shade500,
        borderRadius: BorderRadius.circular(10),
      ),

      child: Text(message),
    );
  }
}
