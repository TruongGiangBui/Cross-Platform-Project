import 'dart:async';

import 'package:app/chat/constants.dart';
import 'package:flutter/material.dart';
import 'package:app/chat/screens/chats/components/body.dart';
import 'package:app/model/user.dart';

import 'package:app/model/chat.dart';
import 'package:app/chat/chatfunction.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  const ChatScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _ChatsScreenState createState() {
    return _ChatsScreenState();
  }
}

class _ChatsScreenState extends State<ChatScreen> {
  int _selectedIndex = 0;
  late List<Chat> listChats = [];
  // late Timer a;
  //late List<Chat> tmp = [];
  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {

    print(listChats);
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(
        user: widget.user,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kPrimaryColor,
        child: const Icon(
          Icons.person_add_alt_1,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: buildBottomNavigatorBar(),
    );
  }

  BottomNavigationBar buildBottomNavigatorBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: (value) {
        setState(() {
          _selectedIndex = value;
        });
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.messenger), label: "Chats"),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "People"),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      title: const Text("Chats"),
      backgroundColor: kPrimaryColor,
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        )
      ],
    );
  }
}
