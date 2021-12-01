import 'package:flutter/material.dart';
import 'package:app/model/post.dart';

class UpdatePost extends StatelessWidget {
  final Post post;
  const UpdatePost({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Update post'),
    );
  }
}
