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
          "_id": "61ae4b11e0e78d2f93729b53",
          "fileName": "20e4bb1f-4623-4e83-a603-a18fc8865a98.png",
          "fileSize": 40575,
          "createdAt": "2021-12-06T17:40:33.697Z",
          "updatedAt": "2021-12-06T17:40:33.697Z",
          "__v": 0
        },
        "cover_image": {
          "type": "other",
          "_id": "60c39eb8f0b2c4268eb53366",
          "fileName": "defaul_cover_image.jpg"
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
