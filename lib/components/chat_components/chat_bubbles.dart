import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatBubbles extends StatelessWidget {
  final String message;
  final Timestamp time;
  final bool isCurrentUser;
  const ChatBubbles({
    super.key,
    required this.message,
    required this.isCurrentUser,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Container(
          constraints: BoxConstraints(minWidth: 80, maxWidth: 270),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(message, style: TextStyle(fontSize: 18)),
              SizedBox(
                width: 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      DateFormat('dd MMM').format(time.toDate()),
                      style: TextStyle(
                        color: Theme.of(
                          context,
                        ).colorScheme.inversePrimary.withValues(alpha: 0.5),
                        fontWeight: FontWeight.w100,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      DateFormat('hh:mm a').format(time.toDate()),
                      style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
        : Container(
          constraints: BoxConstraints(minWidth: 80),
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
