import 'package:flutter_third_lab/model/chat_model.dart';

class TestData {
  static const defaultProfilePicUrl = "assets/person.svg";
  static const defaultGroupPicUrl = "assets/groups.svg";

  static List<ChatModel> contacts = [
    ChatModel(name: "Roman", status: "Hi there!"),
    ChatModel(name: "Andriy", status: "Java Dev"),
    ChatModel(name: "Maksym", status: "Web developer..."),
    ChatModel(name: "Joe Doe", status: "Welcome!"),
    ChatModel(name: "Ron Johnson", status: "Online"),
  ];
}
