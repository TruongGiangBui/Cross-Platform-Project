import 'dart:io' as Io;
import 'package:app/account/Screens/login/login.dart';
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

import 'package:shared_preferences/shared_preferences.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    SharedPreferences.getInstance().then((value) {
      if (value.containsKey('token')) {
        String token = value.get('token').toString();
        if (token != null && token != '') {
          getUser(token).then((res) {
            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              NewsFeed(user: res)));
          });
        }
      }
      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                             LoginScreen()));
    });
    return CircularProgressIndicator() ;
  }
}
