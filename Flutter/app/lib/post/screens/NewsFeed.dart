import 'dart:math';

import 'package:app/chat/screens/chats/chats_screen.dart';
import 'package:app/friends/screen/search_screen.dart';
import 'package:app/model/user.dart';
import 'package:app/post/postsfuction.dart';
import 'package:app/post/widgets/circle_button.dart';
import 'package:app/post/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:app/model/post.dart';
import 'package:app/post/widgets/create_post_container.dart';
import 'package:app/post/widgets/post_container.dart';

class SearchWidget extends StatefulWidget {
  final User user;
  const SearchWidget({Key? key, required this.user}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.purple,
      title: Column(children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration.collapsed(
                    hintText: 'Tìm bạn bè, tin nhắn ...'),
              ),
            ),
            TextButton.icon(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SearchResultWidget(
                          user: widget.user, keyword: controller.text)));
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.green,
                ),
                label: Text('')),
            TextButton.icon(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ChatScreen(user:widget.user)));
                },
                icon: const Icon(
                  Icons.message,
                  color: Colors.green,
                ),
                label: Text('')),
          ],
        )
      ]),
      centerTitle: false,
      floating: true,
    );
  }
}

class NewsFeed extends StatelessWidget {
  final User user;

  const NewsFeed({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Future<List<Post>> posts = getlistpost(user.token);
    // print(posts[0]);
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SearchWidget(user: user),
          SliverToBoxAdapter(child: NavBarContainer(currentUser: user)),
          SliverToBoxAdapter(child: CreatePostContainer(currentUser: user)),
          FutureBuilder(
            future: getlistpost(user.token),
            builder: (context, AsyncSnapshot projectSnap) {
              //                Whether project = projectSnap.data[index]; //todo check your model
              var childCount = 0;
              if (projectSnap.connectionState != ConnectionState.done ||
                  projectSnap.hasData == null)
                childCount = 1;
              else
                childCount = projectSnap.data.length;
              return SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  if (projectSnap.connectionState != ConnectionState.done) {
                    //todo handle state
                    return CircularProgressIndicator(); //todo set progress bar
                  }
                  if (projectSnap.hasData == null) {
                    return Container();
                  }
                  print(projectSnap.data[index]);
                  return PostContainer(
                      user: user, post: projectSnap.data[index]);
                }, childCount: childCount),
              );
            },
          ),
        ],
      ),
    );
  }
}
