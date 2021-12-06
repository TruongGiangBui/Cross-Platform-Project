import 'package:app/model/comment.dart';
import 'package:app/post/postsfuction.dart';
import 'package:app/post/widgets/widgets.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:app/model/user.dart';
import 'package:app/model/post.dart';

class CommentWidget extends StatefulWidget {
  final User user;
  final Post post;
  const CommentWidget({Key? key, required this.user, required this.post})
      : super(key: key);

  @override
  _CommentWidgetState createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();

  Widget commentChild(user, post) {
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
    return FutureBuilder<List<Comment>>(
      future: getlistcomment(widget.user.token, widget.post.id),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<Comment> data = snapshot.data;
          return ListView(
            children: [
              for (var i = 0; i < data.length; i++)
                Padding(
                  padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
                  child: ListTile(
                    leading: GestureDetector(
                      onTap: () async {
                        // Display the image in large form.
                        print("Comment Clicked");
                      },
                      child: Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: new BoxDecoration(
                            color: Colors.blue,
                            borderRadius:
                                new BorderRadius.all(Radius.circular(50))),
                        child: CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                                "http://10.0.2.2:8000/files/" +
                                    data[i].authoravt.toString())),
                      ),
                    ),
                    title: Text(
                      data[i].authorname,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(data[i].content),
                  ),
                )
            ],
          );
        } else if (snapshot.hasError) {
          return Container();
        }
        return Center(
          child: Container(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
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
          child: commentChild(widget.user, widget.post),
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
                // filedata.insert(0, value);
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
