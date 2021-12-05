import 'package:app/post/postsfuction.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:app/model/user.dart';

class TestMe extends StatefulWidget {
  final User user;
  const TestMe({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _TestMeState createState() => _TestMeState();
}

class _TestMeState extends State<TestMe> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List filedata = [
    {
      'name': 'Adeleye Ayodeji',
      'pic': 'https://picsum.photos/300/30',
      'message': 'I love to code'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool'
    },
  ];

  Widget commentChild(data) {
    // return ListView(
    //   children: [
    //     for (var i = 0; i < data.length; i++)
    //       Padding(
    //         padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
    //         child: ListTile(
    //           leading: GestureDetector(
    //             onTap: () async {
    //               // Display the image in large form.
    //               print("Comment Clicked");
    //             },
    //             child: Container(
    //               height: 50.0,
    //               width: 50.0,
    //               decoration: new BoxDecoration(
    //                   color: Colors.blue,
    //                   borderRadius: new BorderRadius.all(Radius.circular(50))),
    //               child: CircleAvatar(
    //                   radius: 50,
    //                   backgroundImage: NetworkImage(data[i]['pic'] + "$i")),
    //             ),
    //           ),
    //           title: Text(
    //             data[i]['name'],
    //             style: TextStyle(fontWeight: FontWeight.bold),
    //           ),
    //           subtitle: Text(data[i]['message']),
    //         ),
    //       )
    //   ],
    // );
    return FutureBuilder(
            future: getlistcomment(user.token),
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comments"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        child: CommentBox(
          userImage:
              "https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400d",
          child: commentChild(filedata),
          labelText: 'Write a comment...',
          withBorder: false,
          errorText: 'Comment cannot be blank',
          sendButtonMethod: () {
            if (formKey.currentState!.validate()) {
              print(commentController.text);
              setState(() {
                var value = {
                  'name': 'New User',
                  'pic':
                      'https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400',
                  'message': commentController.text
                };
                filedata.insert(0, value);
              });
              commentController.clear();
              FocusScope.of(context).unfocus();
            } else {
              print("Not validated");
            }
          },
          formKey: formKey,
          commentController: commentController,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.white),
        ),
      ),
    );
  }
}
