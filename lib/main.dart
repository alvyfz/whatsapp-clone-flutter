import 'package:flutter/material.dart';
import 'package:whatsapp/screen/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: Color(0xff075e54), accentColor: Color(0xff128c7e)),
        home: homeScreen());
  }
}
