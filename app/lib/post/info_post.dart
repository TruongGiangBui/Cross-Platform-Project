import 'package:app/post/widget/PostWidget.dart';
import 'package:flutter/material.dart';
import 'package:app/model/post.dart';

class PostInformation extends StatelessWidget {
  final Post post;
  PostInformation({required this.post});
  @override
  Widget build(BuildContext context) {
    print(this.post.name);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.green,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(children: <Widget>[
        PostWidget(
          post: this.post,
        ),
        SizedBox(
          height: 50,
        ),
        Divider(
          height: 10,
          thickness: 0.5,
        ),
        showInfoPost(this.post)
      ]),
    );
  }

  Widget showInfoPost(Post post) => Column(
        children: [
          ListTile(
            minVerticalPadding: 2,
            title: Text('Tên zalo' + ' ' * (30 - 8) + '${post.name}'),
          ),
          Divider(
            height: 10,
            thickness: 0.5,
          ),
          ListTile(
            minVerticalPadding: 2,
            title: Text('Nội dung post' + ' ' * (30 - 7) + '${post.content}'),
          ),
          Divider(
            height: 10,
            thickness: 0.5,
          ),
        ],
      );
}
