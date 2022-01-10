import 'package:app/account/Screens/login/loadingscreen.dart';
import 'package:app/account/Screens/login/login.dart';
import 'package:app/account/Screens/login/loginfunction.dart';
import 'package:app/model/post.dart';
import 'package:app/model/user.dart';
import 'package:app/profile/profile_page.dart';
import 'package:app/post/screens/NewsFeed.dart';
import 'package:app/server/server.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//--no-sound-null-safety
// 01233210
// 123
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Loading());
    // home:NewsFeed(user: user));
  }
}
