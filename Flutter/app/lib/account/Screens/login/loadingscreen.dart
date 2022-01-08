import 'dart:io' as Io;
import 'package:app/account/Screens/login/loginfunction.dart';
import 'package:app/chat/screens/messages/message_screen.dart';
import 'package:app/friendfuction.dart';
import 'package:app/model/friend.dart';
import 'package:app/post/screens/NewsFeed.dart';
import 'package:app/server/server.dart';
import 'package:app/userfunction.dart';
import 'package:flutter/material.dart';

import 'package:app/model/user.dart';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';

class Loading extends StatefulWidget {
  final String token;
  Loading({required this.token});

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    getUser(widget.token).then((data) => {
         Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => NewsFeed(user: data)),
                    )
        });

    return CircularProgressIndicator();
  }
}
