import 'package:app/chat/components/filled_outline_button.dart';
import 'package:app/chat/constants.dart';
import 'package:app/chat/models/chat.dart';
import 'package:flutter/material.dart';
import 'chat_card.dart';
import 'package:app/chat/screens/messages/message_screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(kDefaultPadding, 0, kDefaultPadding, kDefaultPadding),
          color: kPrimaryColor,
          child: Row(
            children: [
              FillOutLineButton(press: () {}, text: "Recent Message"),
              const SizedBox(width: kDefaultPadding,),
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
            itemCount: chatsData.length,
            itemBuilder: (context, index) => ChatCard(
              chat: chatsData[index],
              press: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MessageScreen(),
                )
              ),
            ),
          ),
        )
      ],
    );
  }
}