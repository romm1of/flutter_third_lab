class ChatModel {
  String name;
  String? picUrl;
  bool? isGroup;
  String? time;
  String? currentMessage;
  String? status;
  bool? select = false;
  int? id;
  ChatModel({
    required this.name,
    this.picUrl,
    this.isGroup,
    this.time,
    this.currentMessage,
    this.status,
    this.select = false,
    this.id,
  });
}
