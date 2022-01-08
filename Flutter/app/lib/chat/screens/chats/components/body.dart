import 'package:app/chat/components/filled_outline_button.dart';
import 'package:app/chat/constants.dart';
import 'package:app/chat/chatfunction.dart';
import 'package:app/chat/models/chat.dart';
import 'package:flutter/material.dart';
import 'chat_card.dart';
import 'package:app/chat/screens/messages/message_screen.dart';
import 'package:app/model/user.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:app/model/chat.dart';

class Body extends StatefulWidget {
  final User user;
  const Body({Key? key, required this.user}) : super(key: key);

  @override
  _BodyState createState() {
    return _BodyState();
  }
}

class _BodyState extends State<Body> {
  late Future<List<Chat>> listChats;
  void refresh() {
    setState(() {
      listChats = getlistchats(widget.user.token);
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      listChats = getlistchats(widget.user.token);
    });

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
          child:
              SwipeDetector(
            onSwipeRight: () {
              setState(() {
                refresh();
              });
            },
            child: CustomScrollView(
              slivers: [
                FutureBuilder(
                  future: listChats,
                  builder: (context, AsyncSnapshot projectSnap) {
                    //                Whether project = projectSnap.data[index]; //todo check your model
                    var childCount = 0;
                    if (projectSnap.connectionState != ConnectionState.done ||
                        projectSnap.hasData == null)
                      childCount = 1;
                    else
                      childCount = projectSnap.data.length;
                    return SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        if (projectSnap.connectionState !=
                            ConnectionState.done) {
                          //todo handle state
                          return CircularProgressIndicator(); //todo set progress bar
                        }
                        if (projectSnap.hasData == null) {
                          return Container();
                        }
          
                        return ChatCard(
                          chat: projectSnap.data[index],
                          press: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MessageScreen(
                                  user: widget.user,
                                  receiverid: projectSnap.data[index].guest,
                                  receiveravt: projectSnap.data[index].guestavt,
                                  receivername:projectSnap.data[index].guestname,
                                  chatid: projectSnap.data[index].id,
                                ),
                              )),
                          user: widget.user,
                        );
                      }, childCount: childCount),
                    );
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
