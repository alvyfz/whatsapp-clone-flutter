class ChatModel {
  String name;
  String icon;
  bool isGroup;
  String status;
  String time;
  String currentMessage;
  bool select = false;
  ChatModel(
      {this.name = "",
      this.icon = "",
      this.isGroup = false,
      this.status = "",
      this.time = "",
      this.currentMessage = "",
      this.select = false});
}
