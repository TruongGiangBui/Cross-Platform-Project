import 'package:app/chat/models/chat.dart';
import 'package:app/model/user.dart';
import 'package:flutter/material.dart';
import 'package:app/chat/constants.dart';
import 'package:app/model/chat.dart';

class ChatCard extends StatelessWidget {
  final Chat chat;
  final VoidCallback press;
  final User user;

  const ChatCard({
    Key? key,
    required this.chat,
    required this.press,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding * 0.75
        ),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage:NetworkImage("http://10.0.2.2:8000/files/" +chat.guestavt.toString()), ///*******************////
                ),
                if(true)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          width: 3
                        )
                      ),
                    ),
                  )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      //chat.name,
                      chat.guestname,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500,
                    ),
                    ),
                  ],
                ),
              ),
            ),
            Opacity(
              opacity: 0.64,
              child: Text(chat.updateAt),
            )
          ],
        ),
      ),
    );
  }

}