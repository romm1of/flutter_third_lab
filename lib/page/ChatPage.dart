import 'package:flutter/material.dart';
import 'package:flutter_third_lab/card/ChatPageCard.dart';
import 'package:flutter_third_lab/model/ChatModel.dart';
import 'package:flutter_third_lab/page/SelectContact.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key? key, required this.chatmodels}) : super(key: key);
  final List<ChatModel> chatmodels;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (builder) => SelectContact()));
        },
        child: Icon(
          Icons.chat,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: widget.chatmodels.length,
        itemBuilder: (contex, index) => ChatPageCard(
          chatModel: widget.chatmodels[index],
        ),
      ),
    );
  }
}
