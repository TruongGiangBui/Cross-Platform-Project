import 'package:app/chat/components/filled_outline_button.dart';
import 'package:app/chat/constants.dart';
import 'package:app/chat/chatfunction.dart';
import 'package:app/chat/models/chat.dart';
import 'package:flutter/material.dart';
import 'chat_card.dart';
import 'package:app/chat/screens/messages/message_screen.dart';
import 'package:app/model/user.dart';

import 'package:app/model/chat.dart';

class Body extends StatefulWidget {
  final User user;
  const Body({Key? key, required this.user})
      : super(key: key);
  @override
  _BodyState createState() {
    return _BodyState();
  }
}

class _BodyState extends State<Body> {
    late List<Chat> listChats = [];
  @override
  Widget build(BuildContext context) {

      getlistchats(widget.user.token).then((res) {
      print(res);
      listChats = res;
    }).catchError((err) {
      print(err);
    });
    print(listChats);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(
              kDefaultPadding, 0, kDefaultPadding, kDefaultPadding),
          color: kPrimaryColor,
          child: Row(
            children: [
              FillOutLineButton(press: () {}, text: "Recent Message"),
              const SizedBox(
                width: kDefaultPadding,
              ),
              FillOutLineButton(
                press: () {},
                text: "Active",
                isFilled: false,
              )
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: listChats.length,
            itemBuilder: (context, index) => ChatCard(
              chat: listChats[index],
              press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MessageScreen(
                      user: widget.user,
                      receiver: widget.user,
                      chatid: listChats[index].id,
                    ),
                  )),
              user: widget.user,
            ),
          ),
        )
      ],
    );
  }
}
