import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medg/assets/icons.dart';

import '../../data/data_source/chat_server.dart';

class ChatPage1 extends StatefulWidget {
  final String receiverUserEmail;
  final String receiverUserId;

  const ChatPage1({
    Key? key,
    required this.receiverUserEmail,
    required this.receiverUserId,
  }) : super(key: key);

  @override
  State<ChatPage1> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage1> {
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(widget.receiverUserId, _messageController.text);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiverUserEmail),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: SvgPicture.asset(AppIcons.back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildMessageList(),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    return StreamBuilder<QuerySnapshot>(
      stream: _chatService.getMessages(_firebaseAuth.currentUser!.uid, widget.receiverUserId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        final List<QueryDocumentSnapshot> messages = snapshot.data!.docs;
        return ListView.builder(
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final Map<String, dynamic> data = messages[index].data() as Map<String, dynamic>;
            final isCurrentUser = data['senderId'] == _firebaseAuth.currentUser!.uid;
            return _buildMessageItem(data['message'], isCurrentUser);
          },
        );
      },
    );
  }

  Widget _buildMessageItem(String message, bool isCurrentUser) {
    return Align(
      alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
          color: isCurrentUser ? Colors.blueAccent : Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          message,
          style: TextStyle(color: isCurrentUser ? Colors.white : Colors.black),
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Xabar yozish',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: SvgPicture.asset('assets/icons/trash.svg'),
                      onPressed: () {
                        _messageController.clear();
                      },
                    ),
                    IconButton(
                      icon: SvgPicture.asset('assets/icons/voice.svg'),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: sendMessage,
            icon: SvgPicture.asset(AppIcons.send),
          ),
        ],
      ),
    );
  }
}
