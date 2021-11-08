import 'package:flutter/material.dart';
import 'package:app/model/post.dart';
import 'package:app/post/widget/profile_avatar.dart';

class PostContainer extends StatelessWidget {
  final Post post;
  const PostContainer({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  Text(post.caption),
                  const SizedBox.shrink()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
            )
          ],
        ));
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;
  const _PostHeader({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imagePath),
        const SizedBox(width: 8.0),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.user.name),
            Row(
              children: [
                Text(
                  '${post.timeAgo} ',
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
        IconButton(
          icon: const Icon(Icons.more_horiz),
          onPressed: () => print('More'),
        ),
      ],
    );
  }
}
