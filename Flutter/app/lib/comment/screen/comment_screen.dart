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
  List<Comment> data = [];
  Widget commentChild(user, post) {
    return FutureBuilder<List<Comment>>(
      future: getlistcomment(widget.user.token, widget.post.id),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView(
            children: [for (var i = 0; i < data.length; i++)
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
                ),
              for (var i = 0; i < snapshot.data.length; i++)
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
                                    snapshot.data[i].authoravt.toString())),
                      ),
                    ),
                    title: Text(
                      snapshot.data[i].authorname,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(snapshot.data[i].content),
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
          userImage: "http://10.0.2.2:8000/files/" +
              widget.user.avatarModel.fileName.toString(),
          child: commentChild(widget.user, widget.post),
          labelText: 'Write a comment...',
          withBorder: false,
          errorText: 'Comment cannot be blank',
          sendButtonMethod: () {
            if (formKey.currentState!.validate()) {
              print(commentController.text);
              setState(() {
                Comment comment = new Comment(
                    content: commentController.text,
                    authorname: widget.user.username,
                    authoravt: widget.user.avatarModel.fileName);
                createComment(
                    widget.user.token, widget.post.id, commentController.text);
                data.add(comment);
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
