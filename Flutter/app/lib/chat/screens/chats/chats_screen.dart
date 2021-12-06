import 'package:app/chat/constants.dart';
import 'package:flutter/material.dart';
import 'package:app/chat/screens/chats/components/body.dart';
import 'package:app/model/user.dart';

class ChatScreen extends StatefulWidget {
  final User user;
  const ChatScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _ChatsScreenState createState() {
    // TODO: implement createState
    print("token:"+ user.token);
    return _ChatsScreenState();
  }
}

class _ChatsScreenState extends State<ChatScreen> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(user: widget.user,),
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
        setState((){
          _selectedIndex = value;
        });
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.messenger), label: "Chats"),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "People"),
        BottomNavigationBarItem(icon: Icon(Icons.call), label: "Calls"),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            radius: 14,
            backgroundImage: AssetImage("assets/images/user_2.png"),
          ),
          label: "Profile"
        )
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