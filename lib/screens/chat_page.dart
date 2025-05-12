import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messaging_app/components/chat_components/chat_bubbles.dart';
import 'package:messaging_app/components/chat_components/chat_textfield.dart';
import 'package:messaging_app/components/login_and_register_components/login_register_textfield.dart';
import 'package:messaging_app/services/auth/auth_services.dart';
import 'package:messaging_app/services/chat/chat_service.dart';

class ChatPage extends StatelessWidget {
  final String receiversEmail;
  final String receiverID;
  ChatPage({super.key, required this.receiversEmail, required this.receiverID});

  final TextEditingController _messageController = TextEditingController();

  final ChatService _chatService = ChatService();
  final AuthServices _authServices = AuthServices();

  // sent message
  void sentMessage() async {
    if (_messageController.text.isNotEmpty) {
      // sent message
      await _chatService.sentMassage(receiverID, _messageController.text);

      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(receiversEmail)),
      body: Column(
        children: [
          //  display all messages
          Expanded(child: _buildMessageList()),

          // user input
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: _buildUserInput(),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderID = _authServices.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatService.getMessage(receiverID, senderID),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading...");
        }
        return ListView(
          children:
              snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
        );
      },
    );
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    // is current user
    bool isCurrentUser =
        data['senderID'] == _authServices.getCurrentUser()!.uid;
    // align message to the right side if sender is the current user ,
    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Column(
        crossAxisAlignment:
            isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          ChatBubbles(
            message: data['message'],
            time: data["timestamp"],
            isCurrentUser: isCurrentUser,
          ),
        ],
      ),
    );
  }

  Widget _buildUserInput() {
    return Row(
      children: [
        Expanded(
          child: ChatTextfield(
            hindText: "Type here...",
            controller: _messageController,
          ),
        ),
        IconButton(onPressed: sentMessage, icon: Icon(Icons.send)),
      ],
    );
  }
}
