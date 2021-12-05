import 'package:flutter/material.dart';
import 'package:app/chat/constants.dart';
import 'package:app/chat/models/chat_message.dart';

class ChatInputField extends StatelessWidget {
  final Function send;
  const ChatInputField({
    Key? key, required this.send,
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
                        this.send(ChatMessage(
                            text: sendMessageController.text,
                            messageType: ChatMessageType.text,
                            messageStatus: MessageStatus.not_view,
                            isSender: true,
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
