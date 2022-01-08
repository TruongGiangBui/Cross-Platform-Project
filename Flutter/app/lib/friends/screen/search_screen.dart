import 'package:app/friendfuction.dart';
import 'package:app/friends/screen/friendprofile.dart';
import 'package:app/model/comment.dart';
import 'package:app/model/friend.dart';
import 'package:app/post/postsfuction.dart';
import 'package:app/post/widgets/widgets.dart';
import 'package:app/userfunction.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:app/model/user.dart';
import 'package:app/model/post.dart';

class SearchResultWidget extends StatefulWidget {
  final User user;
  final String keyword;
  const SearchResultWidget(
      {Key? key, required this.user, required this.keyword})
      : super(key: key);

  @override
  _SearchResultWidgetState createState() => _SearchResultWidgetState();
}

class _SearchResultWidgetState extends State<SearchResultWidget> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List<Friend> data = [];
  Widget UserItem(user) {
    searchUser(widget.user.token, widget.keyword).then((res) {
      print(res.length);
    });
    return FutureBuilder<List<Friend>>(
      future: searchUser(widget.user.token, widget.keyword),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          data = snapshot.data;
          print(snapshot.data[0].username);
          return ListView(
            children: [
              for (var i = 0; i < data.length; i++)
                Padding(
                  padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
                  child: ListTile(
                    leading: GestureDetector(
                      onTap: () async {
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
                                "http://10.0.2.2:8000/files/" +
                                    data[i].avt)),
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
        title: Text("Search"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: UserItem(widget.user)
    );
  }
}
