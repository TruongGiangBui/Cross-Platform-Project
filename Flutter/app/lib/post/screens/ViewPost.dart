import 'package:flutter/material.dart';
import 'package:app/model/user.dart';
import 'package:app/post/widgets/post_container.dart';
import 'package:app/model/post.dart';
import 'package:app/account/Screens/login/login.dart';

class ViewPost extends StatelessWidget {
  final User user;
  const ViewPost({Key? key, required this.user}) : super(key: key);

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
            const Text('Xem bài viết'),
            IconButton(
              icon: const Icon(Icons.report),
              tooltip: 'Report',
              onPressed: () {},
            ),
          ],
        ),
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
                Expanded(child: Text("Rooney va Ronaldo da chay vcl")),
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
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            height: 50.0,
                            child: Column(
                              children: [
                                Text('100'),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.favorite_rounded,
                                      color: Colors.red[600],
                                      size: 20.0,
                                    ),
                                    const SizedBox(width: 4.0),
                                    Text('Like'),
                                  ],
                                ),
                              ],
                            )),
                        Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            height: 50.0,
                            child: Column(
                              children: [
                                Text('10'),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.mode_comment,
                                      color: Colors.red[600],
                                      size: 20.0,
                                    ),
                                    const SizedBox(width: 4.0),
                                    Text('Comments'),
                                  ],
                                ),
                              ],
                            )),
                        Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            height: 50.0,
                            child: Column(
                              children: [
                                Text('1'),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.share,
                                      color: Colors.red[600],
                                      size: 20.0,
                                    ),
                                    const SizedBox(width: 4.0),
                                    Text('Share'),
                                  ],
                                ),
                              ],
                            )),
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
