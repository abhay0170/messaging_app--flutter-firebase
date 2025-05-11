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
    return Theme.of(context).brightness == Brightness.dark
        ? Container(
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
          decoration: BoxDecoration(
            color:
                isCurrentUser
                    ? const Color.fromARGB(255, 62, 0, 137)
                    : Colors.grey.shade700,
            borderRadius: BorderRadius.circular(10),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(message, style: TextStyle(fontSize: 18)),
              Text(
                "hei",
                style: TextStyle(fontWeight: FontWeight.w100, fontSize: 13),
              ),
            ],
          ),
        )
        : Container(
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
          decoration: BoxDecoration(
            color: isCurrentUser ? Colors.green : Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),

          child: Text(message),
        );
  }
}
