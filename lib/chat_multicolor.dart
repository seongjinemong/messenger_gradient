import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/assets/chatbubbles.dart';

class ChatmulticolorPage extends StatefulWidget {
  @override
  _ChatmulticolorPageState createState() => _ChatmulticolorPageState();
}

class _ChatmulticolorPageState extends State<ChatmulticolorPage> {
  var randomizer = new Random();

  ChatBubbles _chatbubbles = new ChatBubbles();

  ColorFiltered _dumpspace(height) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(Colors.white, BlendMode.values[7]),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: height,
        color: Colors.transparent,
      ),
    );
  }

  ColorFiltered _chatbubble(_ismine, _issame) {
    var width =
        (randomizer.nextInt(MediaQuery.of(context).size.width.toInt() - 200) +
                40)
            .toDouble();

    return ColorFiltered(
      colorFilter: ColorFilter.mode(
          Colors.white, _ismine ? BlendMode.values[4] : BlendMode.values[7]),
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: _ismine ? Alignment.centerLeft : Alignment.centerRight,
        color: Colors.transparent,
        child: Container(
          width: width > 300 ? 300 - randomizer.nextInt(150).toDouble() : width,
          height: 40,
          //height: randomizer.nextInt(5) == 1 ? 80 : 40,
          margin: EdgeInsets.only(top: _issame ? 5 : 15, right: 10, left: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.grey.withOpacity(0.5),
          ),
        ),
      ),
    );
  }

  List<Widget> _chatmulticolorbubbles() {
    List<Widget> list = [];

    list.add(_dumpspace(10.0));

    for (var i = 1; i < 100; i++) {
      if (_chatbubbles.ismine[i] == true)
        _chatbubbles.ismine[i - 1]
            ? list.add(_chatbubble(true, true))
            : list.add(_chatbubble(true, false));
      else
        _chatbubbles.ismine[i - 1]
            ? list.add(_chatbubble(false, false))
            : list.add(_chatbubble(false, true));
    }

    list.add(_dumpspace(50.0));

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        title: Text(
          'Chat Gradient Study',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.pinkAccent,
                  Colors.deepPurpleAccent,
                  Colors.lightBlue,
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              alignment: Alignment.topCenter,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Column(
                  children: _chatmulticolorbubbles(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
