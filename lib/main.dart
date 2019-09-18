import 'package:flutter/material.dart';
import 'package:flutter_app/chat.dart';
import 'package:flutter_app/chat_multicolor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatmulticolorPage(),
    );
  }
}
