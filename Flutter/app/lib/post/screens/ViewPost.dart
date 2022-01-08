import 'package:app/comment/screen/comment_screen.dart';
import 'package:flutter/material.dart';
import 'package:app/model/user.dart';
import 'package:app/post/widgets/post_container.dart';
import 'package:app/model/post.dart';
import 'package:app/account/Screens/login/login.dart';
import 'dart:io' as Io;

class ViewPost extends StatelessWidget {
  final User user;
  final Post post;
  const ViewPost({Key? key, required this.user, required this.post})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var imgs = [];
    for (int i = 0; i < post.images.length; i++) {
      imgs.add(post.images[i]['fileName'].toString());
    }
  String readTimestamp(String timestamp) {
    var time = DateTime.parse(timestamp);

    return time.day.toString() +
        "/" +
        time.month.toString() +
        " " +
        time.hour.toString() +
        "-" +
        time.minute.toString();
  }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const Text('Xem bài viết'),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 20.0,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: Image.network("http://10.0.2.2:8000/files/" +
                          user.avatarModel.fileName)
                      .image,
                ),
                const SizedBox(width: 20.0),
               Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.authorname),
            Row(
              children: [
                Text(
                  readTimestamp(post.createAt.toString()),
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 15.0,
                  ),
                ),
                Icon(
                  Icons.public,
                  color: Colors.grey,
                  size: 16.0,
                )
              ],
            )
          ],
        )),
              ],
            ),
            const Divider(height: 10.0, thickness: 0.5),
            Text(post.described,textAlign:TextAlign.left),
            const Divider(height: 10.0, thickness: 0.5),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                  children: imgs.map((e) {
                var card = new Card(
                    elevation: 10,
                    child: Image.network("http://10.0.2.2:8000/files/" + e));
                return card;
              }).toList()),
            )),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            height: 50.0,
                            child: Column(
                              children: [
                                Text(post.likes.length.toString()),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.favorite_rounded,
                                      color: post.isLike == true
                                          ? Colors.red
                                          : Colors.grey,
                                      size: 20.0,
                                    ),
                                    const SizedBox(width: 4.0),
                                    Text('Like'),
                                  ],
                                ),
                              ],
                            )),
                        InkWell(
                          child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              height: 50.0,
                              child: Column(
                                children: [
                                  Text(post.countComments.toString()),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.mode_comment,
                                        color: Colors.grey,
                                        size: 20.0,
                                      ),
                                      const SizedBox(width: 4.0),
                                      Text('Comments'),
                                    ],
                                  ),
                                ],
                              )),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CommentWidget(
                                      user: user,
                                      post: post,
                                    )));
                          },
                        ),
                        Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            height: 50.0,
                            child: Column(
                              children: [
                                Text('1'),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.share,
                                      color: Colors.red[600],
                                      size: 20.0,
                                    ),
                                    const SizedBox(width: 4.0),
                                    Text('Share'),
                                  ],
                                ),
                              ],
                            )),
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
