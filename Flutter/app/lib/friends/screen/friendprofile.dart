import 'dart:io' as Io;
import 'package:app/chat/chatfunction.dart';
import 'package:app/chat/screens/messages/message_screen.dart';
import 'package:app/friendfuction.dart';
import 'package:app/model/friend.dart';
import 'package:app/server/server.dart';
import 'package:app/userfunction.dart';
import 'package:flutter/material.dart';

import 'package:app/model/user.dart';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';

class FriendProfile extends StatefulWidget {
  final double coverImageHeight = 300;
  final double profileHeight = 50;
  final User user;
  final String friendid;
  final bool isfriend;
  FriendProfile(
      {required this.user, required this.friendid, required this.isfriend});

  @override
  _FriendProfileState createState() => _FriendProfileState();
}

class _FriendProfileState extends State<FriendProfile> {
  late User friend;
  bool loaded = false;
  bool ifriend = false;
  bool added = false;
  @override
  Widget build(BuildContext context) {
    getuser(widget.user.token, widget.friendid).then((data) => {
          setState(() {
            friend = data;
            loaded = true;
          })
        });
    getlistfriend(widget.user.token).then((res) {
      for (int i = 0; i < res.length; i++) {
        if (res[i].id == widget.friendid) {
          setState(() {
            ifriend = true;
          });
        }
      }
    });
    sendRequest() {
      setState(() {
        added = true;
      });
      setrequestfriend(widget.user.token, widget.friendid);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        leading: IconButton(
          icon: BackButton(),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () async {
              print("Token id: ${widget.user.token}");
            },
          )
        ],
        backgroundColor: Colors.deepPurple,
      ),
      body: loaded
          ? ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                buildTop(friend),
                buildContent(friend),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton.icon(
                        onPressed: () => {
                              getChatWithUser(
                                      widget.user.token, widget.friendid)
                                  .then((value) {
                                if (value == '') {
                                  sendmessage(widget.user.token,
                                          widget.friendid, '', "Hi")
                                      .then((value) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => MessageScreen(
                                                user: widget.user,
                                                receiverid: friend.id,
                                                receiveravt:
                                                    friend.avatarModel.fileName,
                                                receivername: friend.username,
                                                chatid: value)));
                                  });
                                } else
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => MessageScreen(
                                          user: widget.user,
                                          receiverid: friend.id,
                                          receiveravt:
                                              friend.avatarModel.fileName,
                                          receivername: friend.username,
                                          chatid: value)));
                              })
                            },
                        icon: const Icon(
                          Icons.messenger_sharp,
                          color: Colors.green,
                          size: 50,
                        ),
                        label: Text('Nhắn tin')),
                    !ifriend
                        ? TextButton.icon(
                            onPressed: () => {sendRequest()},
                            icon: const Icon(
                              Icons.add,
                              color: Colors.green,
                              size: 50,
                            ),
                            label: added ? Text("Da gui") : Text('Kết bạn'))
                        : TextButton.icon(
                            onPressed: () => {},
                            icon: const Icon(
                              Icons.chat_rounded,
                              color: Colors.green,
                              size: 50,
                            ),
                            label: Text('Hủy kết bạn')),
                  ],
                )
              ],
            )
          : Container(
              child: CircularProgressIndicator(),
              alignment: Alignment.center,
            ),
    );
  }

  Widget buildTop(User user) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: widget.profileHeight + 10),
          child: buildCoverImage(),
        ),
        Positioned(
          top: widget.coverImageHeight - widget.profileHeight,
          child: buildProfileImage(user),
        ),
      ],
    );
  }

  Widget buildContent(User user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          user.username,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          user.gender,
          style: TextStyle(fontSize: 18),
        )
      ],
    );
  }

  Widget buildProfileImage(User user) {
    String fileName = user.avatarModel.fileName;
    String url = 'http://10.0.2.2:8000/files/' + fileName;
    return CircleAvatar(
      radius: widget.profileHeight,
      backgroundColor: Colors.grey.shade800,
      backgroundImage: NetworkImage(url),
    );
  }

  Widget buildCoverImage() {
    String fileName = widget.user.coverImageModel.fileName;
    String url = 'http://10.0.2.2:8000/files/' + fileName;

    return Container(
        color: Colors.grey,
        child: InkWell(
            onTap: () {},
            child: Container(
                // child: coverImage(isChange, url)
                child: Image.network(
              url,
              width: double.infinity,
              height: widget.coverImageHeight,
              fit: BoxFit.cover,
            ))));
  }
}
