// import 'package:app/model/post.dart';
import 'package:app/model/user.dart';
import 'package:app/profile/profile_page.dart';
import 'package:app/post/screens/NewsFeed.dart';
import 'package:app/server/server.dart';
import 'package:flutter/material.dart';
// import 'account/Screens/login/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImtoYW5oIiwiaWQiOiI2MWEyNGNlOGYzMWE5YTAwMWFiM2VmNjIiLCJpYXQiOjE2MzgwMjY0NzJ9.YhUZV7gQHRSzUezM8qdi_D5B3dC0yW0dYEo8ixF8gAQ";
    User user = User.fromJson({
      "data": {
        "gender": "secret",
        "blocked_inbox": [],
        "blocked_diary": [],
        "id": "61a24ce8f31a9a001ab3ef62",
        "phonenumber": "0932",
        "username": "KHANH DAO MINH",
        "avatar": {
          "type": "image",
          "_id": "61aef38d5bd9b923656078e9",
          "fileName": "908b116f-baf9-4a2b-ad04-5940d48836e3.jpeg",
          "fileSize": 40540,
          "createdAt": "2021-12-07T05:39:25.228Z",
          "updatedAt": "2021-12-07T05:39:25.228Z",
          "__v": 0
        },
        "cover_image": {
          "type": "image",
          "_id": "61aef5675445982d1b9eb4ce",
          "fileName": "6ed0207f-8ae6-4085-ab0d-0974e747e817.jpeg",
          "fileSize": 24983,
          "createdAt": "2021-12-07T05:47:20.008Z",
          "updatedAt": "2021-12-07T05:47:20.008Z",
          "__v": 0
        }
      }
    });
    user.setToken = token;

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Profile(user: user,)
    );

  }
}
