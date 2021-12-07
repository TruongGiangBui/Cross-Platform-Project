//import 'package:app/chat/models/chat_message.dart';
import 'package:app/model/user.dart';
import 'package:flutter/material.dart';
import 'package:app/chat/constants.dart';
import 'package:app/model/message.dart';

class TextMessage extends StatelessWidget {

  const TextMessage({
    Key? key,
    required this.message,
    required this.user,
  }) : super(key: key);

  final Message message;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: MediaQuery.of(context).platformBrightness == Brightness.dark
      //     ? Colors.white
      //     : Colors.black,
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding * 0.75,
        vertical: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity(message.sender==user.id ? 1 : 0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        message.content,
        style: TextStyle(
          color: message.sender == user.id
              ? Colors.white
              : Theme.of(context).textTheme.bodyText1!.color,
        ),
      ),
    );
  }
}
