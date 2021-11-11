import 'package:flutter/material.dart';
import 'package:flutter_third_lab/card/ButtonCard.dart';
import 'package:flutter_third_lab/card/ContactCard.dart';
import 'package:flutter_third_lab/globalStateManagement/StateUserValue.dart';
import 'package:flutter_third_lab/model/ChatModel.dart';
import 'package:flutter_third_lab/util/TestData.dart';
import 'package:flutter_third_lab/page/CreateGroup.dart';
import 'package:provider/provider.dart';

import '../util/TestData.dart';

class SelectContact extends StatefulWidget {
  SelectContact({Key? key}) : super(key: key);

  @override
  _SelectContactState createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    var value = context.watch<StateUserValue>().isRead;
    int _itemCount = 0;

    void _incrementValue() {
      setState(() => {_itemCount++});
      if (_itemCount == 11) {
        _itemCount = 0;
      }
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: value ? Color(0xFF075E54) : Color(0xFFF),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select Contact",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "$_itemCount contacts",
                style: TextStyle(
                  fontSize: 13,
                ),
              )
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {
                  _incrementValue();
                },
                icon: Icon(Icons.add_outlined)),
            IconButton(
                icon: Icon(
                  Icons.search,
                  size: 26,
                ),
                onPressed: () {
                  context.read<StateUserValue>().changeRead(value);
                }),
            PopupMenuButton<String>(
              padding: EdgeInsets.all(0),
              onSelected: (value) {
                print(value);
              },
              itemBuilder: (BuildContext contesxt) {
                return [
                  PopupMenuItem(
                    child: Text("Invite a friend"),
                    value: "Invite a friend",
                  ),
                  PopupMenuItem(
                    child: Text("Contacts"),
                    value: "Contacts",
                  ),
                  PopupMenuItem(
                    child: Text("Refresh"),
                    value: "Refresh",
                  ),
                  PopupMenuItem(
                    child: Text("Help"),
                    value: "Help",
                  ),
                ];
              },
            ),
          ],
        ),
        body: ListView.builder(
            itemCount: TestData.contacts.length + 2,
            itemBuilder: (context, index) {
              if (index == 0) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => CreateGroup()));
                  },
                  child: ButtonCard(
                    icon: Icons.group,
                    name: "New group",
                  ),
                );
              } else if (index == 1) {
                return ButtonCard(
                  icon: Icons.person_add,
                  name: "New contact",
                );
              }
              return ContactCard(
                contact: TestData.contacts[index - 2],
              );
            }));
  }
}
