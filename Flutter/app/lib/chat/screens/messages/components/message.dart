import 'package:app/chat/models/chat_message.dart';
import 'package:app/model/message.dart';
import 'package:app/model/user.dart';
import 'package:flutter/material.dart';
import 'package:app/chat/constants.dart';
import 'audio_message.dart';
import 'text_message.dart';
import 'video_message.dart';


class MessageCard extends StatelessWidget {
  const MessageCard({
    Key? key,
    required this.message,
    required this.user,
    required this.receivertavt
  }) : super(key: key);

  final Message message;
  final User user;
  final String receivertavt;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        mainAxisAlignment:
        message.sender==user.id ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!(message.sender==user.id)) ...[
            CircleAvatar(
              radius: 12,
              backgroundImage: Image.network("http://10.0.2.2:8000/files/" +
                         receivertavt )
                      .image,
            ),
            const SizedBox(width: kDefaultPadding / 2),
          ],
          TextMessage(message: message, user: user,),
          if ((message.sender==user.id)) MessageStatusDot(status: MessageStatus.viewed)
        ],
      ),
    );
  }
}

class MessageStatusDot extends StatelessWidget {
  final MessageStatus? status;

  const MessageStatusDot({Key? key, this.status}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color dotColor(MessageStatus status) {
      switch (status) {
        case MessageStatus.not_sent:
          return kErrorColor;
        case MessageStatus.not_view:
          return Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.1);
        case MessageStatus.viewed:
          return kPrimaryColor;
        default:
          return Colors.transparent;
      }
    }

    return Container(
      margin: const EdgeInsets.only(left: kDefaultPadding / 2),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: dotColor(MessageStatus.viewed),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.done,
        size: 8,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}
