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
import 'package:swipedetector/swipedetector.dart';
import 'package:intl/intl.dart';

class MessageScreen extends StatefulWidget {
  final User user;
  final dynamic receiverid;
  final dynamic receiveravt;
  final dynamic receivername;
  final String chatid;
  const MessageScreen({
    Key? key,
    required this.user,
    required this.receiverid,
    required this.receiveravt,
    required this.receivername,
    required this.chatid,
  }) : super(key: key);

  @override
  _MessageScreenState createState() {
    return _MessageScreenState();
  }
}

class _MessageScreenState extends State<MessageScreen> {
  late Future<List<Message>> listMessages;
  void refresh() {
    setState(() {
      listMessages=
      getlistmessages(widget.user.token, widget.chatid);
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      listMessages = getlistmessages(widget.user.token, widget.chatid);
    });
    
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: SwipeDetector(
                onSwipeRight: () {
                  setState(() {
                    refresh();
                  });
                },
                child: CustomScrollView(
                  slivers: [
                    FutureBuilder(
                      future: listMessages,
                      builder: (context, AsyncSnapshot projectSnap) {
                        //                Whether project = projectSnap.data[index]; //todo check your model
                        var childCount = 0;
                        if (projectSnap.connectionState !=
                                ConnectionState.done ||
                            projectSnap.hasData == null)
                          childCount = 1;
                        else
                          childCount = projectSnap.data.length;
                        return SliverList(
                          delegate:
                              SliverChildBuilderDelegate((context, index) {
                            if (projectSnap.connectionState !=
                                ConnectionState.done) {
                              //todo handle state
                              return CircularProgressIndicator(); //todo set progress bar
                            }
                            if (projectSnap.hasData == null) {
                              return Container();
                            }

                            return MessageCard(
                              message: projectSnap.data[index],
                              user: widget.user,
                              receivertavt: widget.receiveravt,
                            );
                          }, childCount: childCount),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          ChatInputField(
              send: (Message message) async {
                await sendmessage(widget.user.token, widget.receiverid,
                    widget.chatid, message.content);
                refresh();
              },
              receiverId: widget.receiverid,
              receiverName: widget.receivername,
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
          CircleAvatar(
            backgroundImage: NetworkImage(
                "http://10.0.2.2:8000/files/" + widget.receiveravt.toString()),
          ),
          const SizedBox(
            width: kDefaultPadding * 0.75,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.receivername.toString(),
                style: TextStyle(fontSize: 16),
              ),
            ],
          )
        ],
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.local_phone)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
        IconButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OptionScreen(
                    options: optionsDEMO,
                    user: widget.user,
                  ),
                )),
            icon: const Icon(Icons.dehaze_sharp)),
        const SizedBox(
          width: kDefaultPadding / 2,
        )
      ],
    );
  }
}
