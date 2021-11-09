import 'package:app/post/widgets/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:app/model/data.dart';
import 'package:app/model/post.dart';
import 'package:app/post/widgets/create_post_container.dart';
import 'package:app/post/widgets/post_container.dart';

class NewsFeed extends StatelessWidget {
  const NewsFeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
