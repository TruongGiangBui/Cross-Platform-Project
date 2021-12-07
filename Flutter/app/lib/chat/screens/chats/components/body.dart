import 'package:app/chat/components/filled_outline_button.dart';
import 'package:app/chat/constants.dart';
import 'package:app/chat/chatfunction.dart';
import 'package:app/chat/models/chat.dart';
import 'package:flutter/material.dart';
import 'chat_card.dart';
import 'package:app/chat/screens/messages/message_screen.dart';
import 'package:app/model/user.dart';

import 'package:app/model/chat.dart';

class Body extends StatelessWidget {
  final User user;
  final List<Chat> listChats;
  const Body({Key? key, required this.user, required this.listChats}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print("LENGTH");
    // print(listChats.length);
    // getlistmessages(user.token, "61a4fc39ee2832211eb3826d").then((res) {
    //   print(res[1].content);
    // }).catchError((err) {
    //   print(err);
    // });
    // sendmessage(user.token, "618b246c6ba6431a5824931f",
    //     "61a4fc39ee2832211eb3826d", "Chao ban ").then((res) {
    //   print(res);
    // }).catchError((err) {
    //   print(err);
    // });
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
                      user: user,
                      receiver: user,
                      chatid: listChats[index].id,
                    ),
                  )), user: user,
            ),
          ),
        )
      ],
    );
  }
}
