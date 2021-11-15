import 'package:app/post/widget/circle_button.dart';
import 'package:flutter/material.dart';
// import 'package:app/model/data.dart';
import 'package:app/model/post.dart';
import 'package:app/post/widget/create_post_container.dart';
import 'package:app/post/widget/post_container.dart';

class ViewPost extends StatelessWidget {
  const ViewPost({Key? key}) : super(key: key);
  var current
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.purple,
            title: Text('Tìm bạn bè,tin nhắn'),
            centerTitle: false,
            floating: true,
            actions: [
              CircleButton(
                  icon: Icons.search,
                  iconSize: 30.0,
                  onPressed: () => print('Search')),
            ],
          ),
          SliverToBoxAdapter(
              child: CreatePostContainer(currentUser: currentUser)),
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
