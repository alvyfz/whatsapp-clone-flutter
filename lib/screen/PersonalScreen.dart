// ignore: import_of_legacy_library_into_null_safe
import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp/model/ChatModel.dart';

class PersonalScreen extends StatefulWidget {
  const PersonalScreen({Key? key, required this.chatModel}) : super(key: key);
  final ChatModel chatModel;
  @override
  _PersonalScreenState createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  //logic emoji
  bool show = false;
  FocusNode focusNode = FocusNode();
  TextEditingController _controller = TextEditingController();
  @override
  // ignore: must_call_super
  void initState() {
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

//emoji
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          leadingWidth: 70,
          titleSpacing: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_back,
                ),
                CircleAvatar(
                  backgroundColor: Colors.blueGrey[200],
                  radius: 20,
                  child: SvgPicture.asset(
                    widget.chatModel.isGroup
                        ? "assets/group.svg"
                        : "assets/person.svg",
                    width: 37,
                    height: 37,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          title: InkWell(
            onTap: () {},
            child: Container(
              width: 300,
              margin: EdgeInsets.all(7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.chatModel.name,
                    style:
                        TextStyle(fontSize: 18.5, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "online",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
            IconButton(onPressed: () {}, icon: Icon(Icons.call)),
            PopupMenuButton<String>(onSelected: (value) {
              print(value);
            }, itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text(
                    "View contact",
                  ),
                  value: "View contact",
                ),
                PopupMenuItem(
                  child: Text(
                    "Media, links, and docs",
                  ),
                  value: "Media, links, and docs",
                ),
                PopupMenuItem(
                  child: Text(
                    "Search",
                  ),
                  value: "Search",
                ),
                PopupMenuItem(
                  child: Text(
                    "Mute Notifications",
                  ),
                  value: "Mute Notifications",
                ),
                PopupMenuItem(
                  child: Text(
                    "Wallpaper",
                  ),
                  value: "Wallpaper",
                ),
              ];
            })
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        //WillPopScope biar ditekan tombol back ga keluar dulu
        child: WillPopScope(
          child: Stack(
            children: [
              ListView(),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 60,
                            child: Card(
                              margin:
                                  EdgeInsets.only(left: 2, right: 2, bottom: 8),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              child: TextFormField(
                                  controller: _controller,
                                  focusNode: focusNode,
                                  textAlignVertical: TextAlignVertical.center,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 5,
                                  minLines: 1,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Type a message",
                                      prefixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              focusNode.unfocus();
                                              focusNode.canRequestFocus = false;
                                              show = !show;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.emoji_emotions,
                                            color: Colors.grey,
                                          )),
                                      suffixIcon: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                showModalBottomSheet(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder: (builder) =>
                                                        bottomsheet());
                                              },
                                              icon: Icon(
                                                Icons.attach_file,
                                                color: Colors.grey,
                                              )),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.camera_alt,
                                                  color: Colors.grey)),
                                        ],
                                      ),
                                      contentPadding: EdgeInsets.all(5))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 8, right: 5, left: 2),
                            child: CircleAvatar(
                              backgroundColor: Color(0xff128c7e),
                              radius: 25,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.mic,
                                    color: Colors.white,
                                  )),
                            ),
                          )
                        ]),
                        //menampilkan emoji select pada column
                        show ? emojiSelect() : Container()
                      ]))
            ],
          ),
          //logic WillPopScope
          onWillPop: () {
            if (show) {
              setState(() {
                show = false;
              });
            } else {
              Navigator.pop(context);
            }
            return Future.value(false);
          },
          //end WillPopScope
        ),
      ),
    );
  }

//logic Widget bottomsheet
  Widget bottomsheet() {
    return Container(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(
                      Icons.insert_drive_file, Colors.indigo, "Document"),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.camera_alt, Colors.pink, "Camera"),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.insert_photo, Colors.purple, "Gallery"),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(Icons.headset, Colors.orange, "Audio"),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.location_pin, Colors.teal, "Location"),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.person, Colors.blue, "Contact"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(IconData icons, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icons,
              // semanticLabel: "Help",
              size: 29,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              // fontWeight: FontWeight.w100,
            ),
          )
        ],
      ),
    );
  }

//logic Widget menampilkan Emoji
  Widget emojiSelect() {
    return EmojiPicker(
        rows: 4,
        columns: 7,
        onEmojiSelected: (emoji, category) {
          print(emoji);
          setState(() {
            _controller.text = _controller.text + emoji.emoji;
          });
        });
  }
  //end logic emoji
}
