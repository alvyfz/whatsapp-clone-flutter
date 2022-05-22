import 'package:flutter/material.dart';
import 'package:whatsapp/pages/ChatPage.dart';

// ignore: camel_case_types
class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  _homeScreenState createState() => _homeScreenState();
}

// ignore: camel_case_types
class _homeScreenState extends State<homeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          PopupMenuButton<String>(onSelected: (value) {
            print(value);
          }, itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Text(
                  "New group",
                ),
                value: "New group",
              ),
              PopupMenuItem(
                child: Text(
                  "New broadcast",
                ),
                value: "New broadcast",
              ),
              PopupMenuItem(
                child: Text(
                  "Linked device",
                ),
                value: "Linked device",
              ),
              PopupMenuItem(
                child: Text(
                  "Starred Message",
                ),
                value: "Starred Message",
              ),
              PopupMenuItem(
                child: Text(
                  "Settings",
                ),
                value: "Settings",
              ),
            ];
          })
        ],
        bottom: TabBar(
          controller: _controller,
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(text: "CHATS"),
            Tab(text: "STATUS"),
            Tab(
              text: "CALLS",
            )
          ],
        ),
      ),
      body: TabBarView(controller: _controller, children: <Widget>[
        Center(
          child: Text(
            "Camera",
            style: TextStyle(fontSize: 20),
          ),
        ),
        ChatPage(),
        Center(
          child: Text(
            "STATUS",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Center(
          child: Text(
            "CALLS",
            style: TextStyle(fontSize: 20),
          ),
        )
      ]),
    );
  }
}
