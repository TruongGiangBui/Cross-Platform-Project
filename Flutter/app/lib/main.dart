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
        "gender": "male",
        "blocked_inbox": [],
        "blocked_diary": [],
        "_id": "61a24ce8f31a9a001ab3ef62",
        "phonenumber": "0932",
        "username": "KHANH DAO MINH",
        "avatar": {
          "type": "image",
          "_id": "61b49955b0812dedd139b5d7",
          "fileName": "93e1154e-c348-4710-a098-6f69bf4a22dd.png",
          "fileSize": 40663,
          "createdAt": "2021-12-11T12:28:05.410Z",
          "updatedAt": "2021-12-11T12:28:05.410Z",
          "__v": 0
        },
        "cover_image": {
          "type": "image",
          "_id": "61b49c68b0812dedd139b5ea",
          "fileName": "145f422a-1fc1-4fba-8f32-f3432e142cf1.null",
          "fileSize": 40663,
          "createdAt": "2021-12-11T12:41:12.665Z",
          "updatedAt": "2021-12-11T12:41:12.665Z",
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
