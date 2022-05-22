import 'package:flutter/material.dart';
import 'package:whatsapp/model/ChatModel.dart';
import 'package:whatsapp/screen/SelectContact.dart';
import 'package:whatsapp/ui/ChatCard.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
        name: "Alvy Fauzi",
        isGroup: false,
        status: "Available alias hadir",
        currentMessage: "Hi Brother..",
        icon: "person.svg",
        time: "12.34"),
    ChatModel(
        name: "Informatika 19",
        isGroup: true,
        status: "Group Kelas",
        currentMessage: "Ada tugas ga? ",
        icon: "group.svg",
        time: "12.01"),
    ChatModel(
        name: "RedBull Perjuangan",
        isGroup: true,
        status: "Group RedBull",
        currentMessage: "Aman ga? ",
        icon: "group.svg",
        time: "11.32"),
    ChatModel(
        name: "Alex",
        isGroup: false,
        status: "Available alias hadir",
        currentMessage: "Maen hayu kesini...",
        icon: "person.svg",
        time: "10.12"),
    ChatModel(
        name: "Desigraf 19",
        isGroup: true,
        status: "Grup Desigraf",
        currentMessage: " Stiker ",
        icon: "group.svg",
        time: "09.01"),
    ChatModel(
        name: "Kakang",
        isGroup: false,
        status: "Sibuk",
        currentMessage: "Can u help me?",
        icon: "person.svg",
        time: "8.50"),
    ChatModel(
        name: "Siska",
        isGroup: false,
        status: "Busy",
        currentMessage: "Siskaeeeee niihhh",
        icon: "person.svg",
        time: "8.40"),
    ChatModel(
        name: "Loki",
        isGroup: false,
        status: "Available in Asgar",
        currentMessage: "When u will come here?",
        icon: "person.svg",
        time: "8.36"),
    ChatModel(
        name: "Pizza Hut",
        isGroup: false,
        status: "Available alias hadir",
        currentMessage: "Honey, Im alone now!",
        icon: "person.svg",
        time: "8.32"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (builder) => SelectContact()));
          },
          child: Icon(Icons.chat),
        ),
        body: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) => ChatCard(chatModel: chats[index]),
        ));
  }
}
