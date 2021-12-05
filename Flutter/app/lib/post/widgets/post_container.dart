import 'package:app/account/Screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:app/model/post.dart';
import 'package:app/post/widgets/profile_avatar.dart';
<<<<<<< HEAD
=======
import 'package:app/post/widgets/update_post.dart';
import 'package:intl/intl.dart';
>>>>>>> d24154e401e0175379a2c5015883b278a846fd58

class PostContainer extends StatelessWidget {
  final Post post;
  const PostContainer({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (post.images.length > 0) print(post.images[0]['fileName']);
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
                  _PostHeader(post: post),
                  const SizedBox(height: 4.0),
<<<<<<< HEAD
                  Text(post.described.toString()),
=======
                  Text(post.described),
>>>>>>> d24154e401e0175379a2c5015883b278a846fd58
                  const SizedBox.shrink(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
<<<<<<< HEAD
              child: Image.network(post.images[0]),
=======
              child: post.images.length > 0
                  ? Image.network("http://10.0.2.2:8000/files/" +
                      post.images[0]['fileName'].toString())
                  : null,
>>>>>>> d24154e401e0175379a2c5015883b278a846fd58
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: _PostStats(post: post),
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
<<<<<<< HEAD
        ProfileAvatar(imageUrl: post.author.avatar.toString()),
=======
        ProfileAvatar(imageUrl: "http://10.0.2.2:8000/files/" + post.authoravt),
>>>>>>> d24154e401e0175379a2c5015883b278a846fd58
        const SizedBox(width: 8.0),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
<<<<<<< HEAD
            Text(post.author.username.toString()),
            Row(
              children: [
                Text(
                  '${post.createAt} ',
=======
            Text(post.authorname),
            Row(
              children: [
                Text(
                  readTimestamp(post.createAt.toString()),
>>>>>>> d24154e401e0175379a2c5015883b278a846fd58
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
<<<<<<< HEAD
        IconButton(
          icon: const Icon(Icons.more_horiz),
          onPressed: () => print('More'),
        ),
=======
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
>>>>>>> d24154e401e0175379a2c5015883b278a846fd58
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;

  const _PostStats({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _PostLike(
              post: post,
              label: 'Like',
<<<<<<< HEAD
              count: post.likes.length,
              onTap: () => print('Like'),
=======
              onTap: () => {},
>>>>>>> d24154e401e0175379a2c5015883b278a846fd58
            ),
            _PostComment(
              post: post,
              label: 'Comment',
<<<<<<< HEAD
              count: post.countComments,
              onTap: () => print('Comment'),
            ),
            _PostButton(
              icon: Icon(
                Icons.share,
                color: Colors.grey[600],
                size: 25.0,
              ),
              label: 'Share',
              count: post.countComments,
              onTap: () => print('Share'),
            )
=======
              onTap: () {},
            ),
>>>>>>> d24154e401e0175379a2c5015883b278a846fd58
          ],
        ),
      ],
    );
  }
}

class _PostLike extends StatelessWidget {
  final String label;
  final Function onTap;
  final Post post;

  const _PostLike(
      {Key? key,
      required this.post,
      required this.label,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () => {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LoginScreen()))
          },
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              height: 50.0,
              child: Column(
                children: [
                  Text(post.likes.length.toString()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite_rounded,
                        color: post.isLike ? Colors.red[600] : Colors.grey[600],
                        size: 20.0,
                      ),
                      const SizedBox(width: 4.0),
                      Text(label),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
<<<<<<< HEAD
=======
}

class _PostComment extends StatelessWidget {
  final String label;
  final Function onTap;
  final Post post;

  const _PostComment(
      {Key? key,
      required this.post,
      required this.label,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () => {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LoginScreen()))
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
                      Text(label),
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
>>>>>>> d24154e401e0175379a2c5015883b278a846fd58
}
