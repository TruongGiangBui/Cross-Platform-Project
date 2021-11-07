import 'package:app/model/post.dart';
import 'package:flutter/material.dart';
import 'info_post.dart';

class PostSetting extends StatelessWidget {
  final Post post;
  const PostSetting({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Post currentpost = this.post;
    return Scaffold(
        appBar: AppBar(
          title: Text(this.post.name),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Thông tin"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PostInformation(
                              post: currentpost,
                            )));
              },
            ),
          ],
        ));
  }
}
