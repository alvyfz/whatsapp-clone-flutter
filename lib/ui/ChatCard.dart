import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp/model/ChatModel.dart';
import 'package:whatsapp/screen/PersonalScreen.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({Key? key, required this.chatModel}) : super(key: key);
  final ChatModel chatModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PersonalScreen(chatModel: chatModel)));
      },
      child: Column(children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blueGrey[200],
            radius: 30,
            // child: Icon(
            //   Icons.group,
            //   size: 37,
            //   color: Colors.white,
            child: SvgPicture.asset(
              chatModel.isGroup ? "assets/group.svg" : "assets/person.svg",
              width: 37,
              height: 37,
              color: Colors.white,
            ),
          ),
          title: Text(
            chatModel.name,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: [
              Icon(
                Icons.done_all,
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                chatModel.currentMessage,
                style: TextStyle(fontSize: 13),
              )
            ],
          ),
          trailing: Text(chatModel.time),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 80,
            right: 20,
          ),
          child: Divider(
            thickness: 1,
          ),
        )
      ]),
    );
  }
}
