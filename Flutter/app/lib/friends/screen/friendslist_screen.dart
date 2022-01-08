import 'package:app/friendfuction.dart';
import 'package:app/friends/screen/friendprofile.dart';
import 'package:app/model/comment.dart';
import 'package:app/model/friend.dart';
import 'package:app/post/postsfuction.dart';
import 'package:app/post/widgets/widgets.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:app/model/user.dart';
import 'package:app/model/post.dart';

class FriendListWidget extends StatefulWidget {
  final User user;
  const FriendListWidget({Key? key, required this.user}) : super(key: key);

  @override
  _FriendListWidgetState createState() => _FriendListWidgetState();
}

class _FriendListWidgetState extends State<FriendListWidget> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List<Friend> data = [];
  Widget FriendItem(user) {
    return FutureBuilder<List<Friend>>(
      future: getlistfriend(widget.user.token),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          data = snapshot.data;
          return ListView(
            children: [
              for (var i = 0; i < data.length; i++)
                Padding(
                  padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
                  child: ListTile(
                    leading: GestureDetector(
                      onTap: () async {
                        // Display the image in large form.
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => FriendProfile(
                                user: user, friendid: data[i].id,isfriend: true,)));
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
                                "http://10.0.2.2:8000/files/" + data[i].avt)),
                      ),
                    ),
                    title: Text(
                      data[i].username,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
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
        title: Text("Ban be"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        child: FriendItem(widget.user),
      ),
    );
  }
}
