import 'dart:async';

import 'package:app/chat/chatfunction.dart';
import 'package:app/chat/constants.dart';
import 'package:app/chat/screens/messages/components/message.dart';
import 'package:flutter/material.dart';
import 'package:app/chat/screens/messages/components/body.dart';

import 'package:app/chat/screens/options/option_screen.dart';
import 'package:app/chat/screens/options/components/options.dart';
import 'package:app/model/user.dart';
import 'package:app/chat/screens/messages/components/chat_input_field.dart';
import 'package:app/chat/models/chat_message.dart';

import 'package:app/model/message.dart';

import 'package:intl/intl.dart';

class MessageScreen extends StatefulWidget {
  final User user;
  final User receiver;
  final String chatid;
  const MessageScreen({
    Key? key,
    required this.user,
    required this.receiver,
    required this.chatid,
  }) : super(key: key);

  @override
  _MessageScreenState createState() {
    return _MessageScreenState();
  }

}

class _MessageScreenState extends State<MessageScreen> {
  late List<Message> listMessages = [];


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

getlistmessages(widget.user.token, "61a4fc39ee2832211eb3826d").then((res) {
        print("--------LOAD LIST MESSAGE--------");
          listMessages = res;

      }).catchError((err) {
        print(err);
      });
          var demoChat = listMessages;
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: ListView.builder(
                itemCount: demoChat.length,
                itemBuilder: (context, index) =>
                    MessageCard(message: demoChat[index], user: widget.user,),
              ),
            ),
          ),
           ChatInputField(send: (message){
            this.setState(() {
              demoChat.add(message);
            });
          },receiverId: widget.receiver.id,
             receiverName: widget.receiver.username,
             avatar: "assets/images/user_3.png",
             update: DateTime.now(),
               user: widget.user),
        ],
      ),
    );
  }


  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: kPrimaryColor,
      title: Row(
        children: [
          const BackButton(),
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/user_3.png"),
          ),
          const SizedBox(width: kDefaultPadding * 0.75,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.user.username.toString(),
                style: TextStyle(fontSize: 16),
              ),
              // Text(
              //   "Active 3m ago",
              //   style: TextStyle(fontSize: 12),
              // )
            ],
          )
        ],
      ),
      actions: [
        IconButton(onPressed: (){}, icon: const Icon(Icons.local_phone)),
        IconButton(onPressed: (){}, icon: const Icon(Icons.videocam)),
        IconButton(onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OptionScreen(options: optionsDEMO, user: widget.user,),
            )
        ), icon: const Icon(Icons.dehaze_sharp)),
        const SizedBox(width: kDefaultPadding / 2,)
      ],
    );
  }
}