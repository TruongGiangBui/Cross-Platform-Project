import 'package:app/model/user.dart';
import 'package:app/post/postsfuction.dart';
import 'package:app/post/widgets/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:app/post/widgets/create_post_container.dart';
import 'package:app/post/widgets/post_container.dart';
import 'package:app/model/user.dart';
import 'package:app/post/screens/postsfuction.dart';
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
              )
            ]),
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
          //               return Container(
          //                   child: ListView.builder(
          //                       itemCount: snapshot.data.length,
          //                       scrollDirection: Axis.horizontal,
          //                       itemBuilder: (BuildContext context, int index) {
          //                         return PostContainer(post: snapshot.data[index]);
          //                       }));
          //             }
          //           }))
          // ])),

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
                  return PostContainer(post: projectSnap.data[index]);
                }, childCount: childCount),
              );
            },
          ),
        ],
      ),
    );
  }
}
