import 'dart:math';

import 'package:app/model/message.dart';
import 'package:app/model/registerresponse.dart';
import 'package:app/model/user.dart';
import 'package:flutter/material.dart';
import 'package:app/chat/constants.dart';
import 'package:app/chat/models/chat_message.dart';

import '../../../chatfunction.dart';

class ChatInputField extends StatelessWidget {
  final User user;
  final Function send;
  String receiverId;
  String receiverName;
  dynamic update;
  dynamic avatar;
  ChatInputField({
    Key? key, required this.send,
    required this.receiverId, required this.receiverName, required this.update, required this.avatar, required this.user
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sendMessageController = TextEditingController();
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 32,
            color: const Color(0xFF087949).withOpacity(0.08),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            SizedBox(
                height: 18.0,
                width: 18.0,
                child: new IconButton(
                  padding: new EdgeInsets.all(0.0),
                  icon: new Icon(Icons.attach_file),
                  onPressed: (){},
                )
            ),

            const SizedBox(width: kDefaultPadding / 2),

            SizedBox(
                height: 18.0,
                width: 18.0,
                child: new IconButton(
                  padding: new EdgeInsets.all(0.0),
                  icon: new Icon(Icons.camera_alt_outlined),
                  onPressed: (){},
                )
            ),
            const SizedBox(width: kDefaultPadding/2),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding * 0.75,
                ),
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [

                    IconButton(onPressed: (){}, icon: Icon(Icons.sentiment_satisfied_alt_outlined,),),
                    const SizedBox(width: kDefaultPadding / 4),
                    Expanded(
                      child: TextField(
                        controller: sendMessageController,
                        decoration: InputDecoration(
                          hintText: "Type message",
                          border: InputBorder.none,
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed: (){
                        this.send(Message(
                          id: Random().nextDouble().toString(),
                          sender: receiverId,
                          sendername: receiverName,
                          updateAt: update,
                          content: sendMessageController.text,
                          senderavt: avatar,
                        ));
                      },
                      icon: Icon(Icons.send, color: kPrimaryColor,),
                    )

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
