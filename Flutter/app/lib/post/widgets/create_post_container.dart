import 'package:app/post/screens/CreatePost.dart';
import 'package:flutter/material.dart';
import 'package:app/model/user.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;
  const CreatePostContainer({Key? key, required this.currentUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(currentUser.avatarModel.fileName);
    return Container(
        padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20.0,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: Image.network("http://10.0.2.2:8000/files/" +
                          currentUser.avatarModel.fileName)
                      .image,
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                        hintText: 'Hôm nay bạn thế nào ?'),
                  ),
                ),
              ],
            ),
            const Divider(height: 10.0, thickness: 0.5),
            Container(
              height: 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton.icon(
                      onPressed: ()  {
                        Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CreatePost(user:currentUser)));
                      },
                      icon: const Icon(
                        Icons.photo_library,
                        color: Colors.green,
                      ),
                      label: Text('Đăng hình')),
                  VerticalDivider(width: 11.0),
                  TextButton.icon(
                      onPressed: () => print('Đăng video'),
                      icon: const Icon(
                        Icons.video_library,
                        color: Colors.green,
                      ),
                      label: Text('Đăng video')),
                  VerticalDivider(width: 11.0),
                  TextButton.icon(
                      onPressed: () => print('Kỉ niệm'),
                      icon: const Icon(
                        Icons.alarm_rounded,
                        color: Colors.green,
                      ),
                      label: Text('Kỉ niệm')),
                ],
              ),
            )
          ],
        ));
  }
}
