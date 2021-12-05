import 'package:flutter/material.dart';
import 'package:app/model/post.dart';
import 'package:app/post/widgets/profile_avatar.dart';

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
                  Text(post.described.toString()),
                  const SizedBox.shrink(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Image.network(post.images[0]),
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

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.author.avatar.toString()),
        const SizedBox(width: 8.0),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.author.username.toString()),
            Row(
              children: [
                Text(
                  '${post.createAt} ',
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

class _PostStats extends StatelessWidget {
  final Post post;

  const _PostStats({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row(
        //   children: [
        //     Container(
        //       padding: const EdgeInsets.all(4.0),
        //       decoration: BoxDecoration(
        //         color: Colors.amber[300],
        //         shape: BoxShape.circle,
        //       ),
        //       child: const Icon(
        //         Icons.thumb_up,
        //         size: 10.0,
        //         color: Colors.white,
        //       ),
        //     ),
        //     const SizedBox(width: 4.0),
        //     Expanded(
        //       child: Text(
        //         '${post.likes}',
        //         style: TextStyle(
        //           color: Colors.grey[600],
        //         ),
        //       ),
        //     ),
        //     Text(
        //       '${post.comments} Comments',
        //       style: TextStyle(
        //         color: Colors.grey[600],
        //       ),
        //     ),
        //     const SizedBox(width: 8.0),
        //     Text(
        //       '${post.shares} Shares',
        //       style: TextStyle(
        //         color: Colors.grey[600],
        //       ),
        //     )
        //   ],
        // ),
        // const Divider(),
        Row(
          children: [
            _PostButton(
              icon: Icon(
                Icons.favorite_rounded,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label: 'Like',
              count: post.likes.length,
              onTap: () => print('Like'),
            ),
            _PostButton(
              icon: Icon(
                Icons.mode_comment,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label: 'Comment',
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
          ],
        ),
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function onTap;
  final int count;

  const _PostButton(
      {Key? key,
      required this.icon,
      required this.label,
      required this.count,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () => print('ontap'),
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              height: 50.0,
              child: Column(
                children: [
                  Text('$count'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      icon,
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
