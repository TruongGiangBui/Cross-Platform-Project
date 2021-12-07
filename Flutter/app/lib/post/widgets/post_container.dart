import 'package:app/account/Screens/login/login.dart';
import 'package:app/comment/screen/comment_screen.dart';
import 'package:app/model/user.dart';
import 'package:app/post/postsfuction.dart';
import 'package:flutter/material.dart';
import 'package:app/model/post.dart';
import 'package:app/post/widgets/profile_avatar.dart';
import 'package:app/post/widgets/update_post.dart';
import 'package:intl/intl.dart';

class PostContainer extends StatefulWidget {
  final Post post;
  final User user;
  const PostContainer({Key? key, required this.user, required this.post})
      : super(key: key);

  @override
  _PostContainerState createState() => _PostContainerState();
}

class _PostContainerState extends State<PostContainer> {
  @override
  Widget build(BuildContext context) {
    if (widget.post.images.length > 0) print(widget.post.images[0]['fileName']);
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _PostHeader(post: widget.post),
                  const SizedBox(height: 4.0),
                  Text(widget.post.described),
                  const SizedBox.shrink(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: widget.post.images.length > 0
                  ? Image.network("http://10.0.2.2:8000/files/" +
                      widget.post.images[0]['fileName'].toString())
                  : null,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: _PostStats(user: widget.user, post: widget.post),
            )
          ],
        ));
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({Key? key, required this.post}) : super(key: key);
  String readTimestamp(String timestamp) {
    var time = DateTime.parse(timestamp);

    return time.day.toString() +
        "/" +
        time.month.toString() +
        " " +
        time.hour.toString() +
        "-" +
        time.minute.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: "http://10.0.2.2:8000/files/" + post.authoravt),
        const SizedBox(width: 8.0),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.authorname),
            Row(
              children: [
                Text(
                  readTimestamp(post.createAt.toString()),
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12.0,
                  ),
                ),
                Icon(
                  Icons.public,
                  color: Colors.grey[200],
                  size: 12.0,
                )
              ],
            )
          ],
        )),
        Container(
            child: PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem(
              child: TextButton(
                onPressed: () => print('helo'),
                child: Row(
                  children: [
                    Icon(
                      Icons.change_circle,
                      color: Colors.grey[600],
                      size: 20.0,
                    ),
                    Text('Chỉnh sửa'),
                  ],
                ),
              ),
              value: 1,
              onTap: () => print('hi'),
            ),
            PopupMenuItem(
              child: TextButton(
                onPressed: () => showAlertDialog(context),
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.grey[600],
                      size: 20.0,
                    ),
                    Text('Xóa bài viết'),
                  ],
                ),
              ),
              value: 2,
              onTap: () => print('hi'),
            ),
          ],
        ))
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;
  final User user;
  const _PostStats({Key? key, required this.user, required this.post})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _PostLike(
              user: user,
              post: post,
            ),
            _PostComment(
              user: user,
              post: post,
            ),
          ],
        ),
      ],
    );
  }
}

class _PostLike extends StatefulWidget {
  final Post post;
  final User user;
  const _PostLike({Key? key, required this.user, required this.post})
      : super(key: key);
  @override
  _PostLikeState createState() => _PostLikeState();
}

class _PostLikeState extends State<_PostLike> {
  bool islike = false;
  int countlike = 0;
  String scount = "0";
  Color _colorContainer = Colors.grey;
  @override
  Widget build(BuildContext context) {
    setState(() {
      bool islike = widget.post.isLike;
      countlike = widget.post.likes.length;
      if (islike) _colorContainer = Colors.red;
    });
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () {
            likepost(widget.user.token, widget.post.id);
            setState(() {
              countlike = countlike + 1;
              scount = countlike.toString();
              if (islike) {
                islike = false;
                _colorContainer = Colors.grey;
              } else {
                islike = true;
                _colorContainer = Colors.red;
              }
            });
          },
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              height: 50.0,
              child: Column(
                children: [
                  Text(scount),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite_rounded,
                        color: _colorContainer,
                        size: 20.0,
                      ),
                      const SizedBox(width: 4.0),
                      Text("Like"),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class _PostComment extends StatelessWidget {
  final Post post;
  final User user;

  const _PostComment({Key? key, required this.user, required this.post})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () => {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CommentWidget(
                      user: user,
                      post: post,
                    )))
          },
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              height: 50.0,
              child: Column(
                children: [
                  Text(post.countComments.toString()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.mode_comment,
                        color: Colors.grey[600],
                        size: 20.0,
                      ),
                      const SizedBox(width: 4.0),
                      Text("Comment"),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed: () {},
  );
  Widget continueButton = TextButton(
    child: Text("OK"),
    onPressed: () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Delete"),
    content: Text("Would you like to delete this post?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
