import 'package:flutter/material.dart';
import 'package:flutter_third_lab/model/ChatModel.dart';
import 'package:flutter_third_lab/page/ChatPage.dart';
import 'package:flutter_third_lab/util/TestData.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  bool _selected = true;

  void _changeIcon() {
    setState(() {
      _selected = !_selected;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF075E54),
        title: Text("Whatsapp"),
        actions: [
          IconButton(
              icon: Icon(_selected ? Icons.search : Icons.celebration),
              onPressed: () {
                _changeIcon();
              }),
          PopupMenuButton<String>(
            onSelected: (value) {},
            itemBuilder: (BuildContext contesxt) {
              return [
                PopupMenuItem(
                  child: Text("New group"),
                  value: "New group",
                ),
                PopupMenuItem(
                  child: Text("New broadcast"),
                  value: "New broadcast",
                ),
                PopupMenuItem(
                  child: Text("Whatsapp Web"),
                  value: "Whatsapp Web",
                ),
                PopupMenuItem(
                  child: Text("Starred messages"),
                  value: "Starred messages",
                ),
                PopupMenuItem(
                  child: Text("Settings"),
                  value: "Settings",
                ),
              ];
            },
          )
        ],
        bottom: TabBar(
          controller: _controller,
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: "CHATS",
            ),
            Tab(
              text: "STATUS",
            ),
            Tab(
              text: "CALLS",
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          Scaffold(),
          ChatPage(
            chatmodels: TestData.contacts,
          ),
          Text("STATUS"),
          Text("Calls"),
        ],
      ),
    );
  }
}
