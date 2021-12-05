import 'package:app/model/post.dart';
import 'package:app/model/user.dart';
import 'package:app/post/screens/NewsFeed.dart';
import 'package:flutter/material.dart';
import 'post/screens/NewsFeed.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImdpYW5nIGJ1aSIsImlkIjoiNjE3NTJkZjc5YmE4MmMzNjc3ZTBmMDcyIiwiaWF0IjoxNjM2MzgxMTkwfQ.GcvfpsrphUAcvhp42FzKD3Kii8RtNh9MG2dqKgVu5-Q";
    User user = User.fromJson({
      "data": {
        "gender": "secret",
        "blocked_inbox": [],
        "blocked_diary": [],
        "_id": "61752df79ba82c3677e0f072",
        "phonenumber": "0979722708",
        "username": "giang bui",
        "avatar": {
          "type": "other",
          "_id": "60c39f54f0b2c4268eb53367",
          "fileName": "avatar_2.png"
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
        home: NewsFeed(user: user));
  }
}
