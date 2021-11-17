// import 'package:app/model/post.dart';
import 'package:app/model/user.dart';
import 'package:app/profile/profile_page.dart';
import 'package:app/post/screens/NewsFeed.dart';
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
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6Iktow6FuaCIsImlkIjoiNjE4N2Q4YWJlNTRlYjAwMDFhZTE3ODUwIiwiaWF0IjoxNjM3MTYwNzE0fQ.SHGYkPFpOTkfjNFpAgT9qD6A1C4eWGU7o_DoAfF91uI";
    User user = User.fromJson({
      "data": {
        "gender": "secret",
        "blocked_inbox": [],
        "blocked_diary": [],
        "_id": "6187d8abe54eb0001ae17850",
        "phonenumber": "0366928055",
        "username": "Khánh",
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
      home: Profile(user: user,)
    );

  }
}
