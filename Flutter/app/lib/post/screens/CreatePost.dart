import 'package:flutter/material.dart';
import 'package:app/model/user.dart';

class CreatePost extends StatelessWidget {
  final User user;
  const CreatePost({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> image_urls = [
      'https://d5nunyagcicgy.cloudfront.net/external_assets/hero_examples/hair_beach_v391182663/original.jpeg',
      'https://photo-cms-plo.zadn.vn/w800/Uploaded/2021/bivxpcwk/2021_08_30/rooney-2_ifdi.jpg',
      ''
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(onPressed: () {}, icon: Icon(Icons.cancel_outlined)),
            const Text('Tạo bài viết'),
            IconButton(
              icon: const Icon(Icons.post_add),
              tooltip: 'Post',
              onPressed: () {},
            ),
          ],
        ),
        // actions: <Widget>[
        //   IconButton(
        //     icon: const Icon(Icons.post_add),
        //     tooltip: 'Post',
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 20.0,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: Image.network("http://10.0.2.2:8000/files/" +
                          user.avatarModel.fileName)
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
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    elevation: 10,
                    child: Image.network(image_urls[0]),
                  ),
                  Card(
                    elevation: 10,
                    child: Image.network(image_urls[1]),
                  ),
                  Card(
                    elevation: 10,
                    child: Image.network(image_urls[0]),
                  )
                ],
              ),
            )),
            const Divider(height: 10.0, thickness: 0.5),
            Container(
              height: 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton.icon(
                      onPressed: () => print('Đăng hình'),
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
                      onPressed: () => print('Cảm xúc'),
                      icon: const Icon(
                        Icons.emoji_emotions,
                        color: Colors.green,
                      ),
                      label: Text('Cảm Xúc')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
