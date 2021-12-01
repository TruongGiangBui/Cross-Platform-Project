import 'package:app/post/postsfuction.dart';
import 'package:app/post/widgets/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:app/model/post.dart';
import 'package:app/model/user.dart';
import 'package:app/post/widgets/create_post_container.dart';
import 'package:app/post/widgets/post_container.dart';

class NewsFeed extends StatelessWidget {
  final User user;
  const NewsFeed({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const posts = [];
    print("token:" + user.token);

    // getlistpost(user.token).then((res) => {print(res[1].authoravt)}).catchError((err) {
    //   print(err);
    // });
    // createpost(user.token, [], [], "dung thu apii")
    //     .then((res) => {print(res.authoravt)})
    //     .catchError((err) {
    //   print(err);
    // });
    // getpost(user.token,"61a6362ec633076440d796cd")
    //     .then((res) => {print(res.authoravt)})
    //     .catchError((err) {
    //   print(err);
    // });
    // deletepost(user.token,"618b24bf6ba6431a58249322")
    //     .then((res) => {print(res)})
    //     .catchError((err) {
    //   print(err);
    // });
    //  likepost(user.token,"61a6362ec633076440d796cd")
    //     .then((res) => {print(res)})
    //     .catchError((err) {
    //   print(err);
    // });
    // getlistcomment(user.token,"61a6362ec633076440d796cd")
    //     .then((res) => {print(res[0].authorname)})
    //     .catchError((err) {
    //   print(err);
    // });
    createComment(user.token,"61a6362ec633076440d796cd","cmt phat do troi")
        .then((res) => {print(res)})
        .catchError((err) {
      print(err);
    });
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.purple,
            title: Column(children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration.collapsed(
                          hintText: 'Tìm bạn bè, tin nhắn ...'),
                    ),
                  ),
                ],
              )
            ]),
            centerTitle: false,
            floating: true,
            actions: [
              CircleButton(
                  icon: Icons.search,
                  iconSize: 25.0,
                  onPressed: () => print('Search')),
              CircleButton(
                  icon: Icons.notifications,
                  iconSize: 25.0,
                  onPressed: () => print('Notifications'))
            ],
          ),
          SliverToBoxAdapter(child: CreatePostContainer(currentUser: user)),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              final Post post = posts[index];
              return PostContainer(post: post);
            },
            childCount: posts.length,
          ))
        ],
      ),
    );
  }
}
