import 'package:app/post/postsfuction.dart';
import 'package:flutter/material.dart';
import 'package:app/model/user.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'dart:io' as Io;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';

class CreatePost extends StatefulWidget {
  final User user;
  const CreatePost({Key? key, required this.user}) : super(key: key);
  @override
  CreatePostState createState() => CreatePostState();
}

class CreatePostState extends State<CreatePost> {
  List images = [];
  late PickedFile? _imageFile = PickedFile('assets/images/image.jpg');
  final ImagePicker _picker = ImagePicker();
  final TextEditingController textEditingController =
      new TextEditingController();
  void takePhoto(ImageSource source) async {
    final pickedfile = await _picker.getImage(source: source, imageQuality: 40);
    setState(() {
      _imageFile = pickedfile!;
      print(_imageFile!.path);
      images.add(_imageFile!.path);
    });
  }

  void uploadpost() {
    var imagesencode = [];
    for (int i = 0; i < images.length; i++) {
      final bytes = Io.File(images[i]).readAsBytesSync();
      String path = _imageFile!.path;
      int lastDotIndex = path.lastIndexOf('.');
      String extension = path.substring(lastDotIndex + 1, path.length);
      String base64 = 'data:image/$extension;base64,' + base64Encode(bytes);
      imagesencode.add(base64);
    }

    print(imagesencode);
    print(textEditingController.text);
    // updatePhoto(base64, widget.user.token, false);
    createpost(widget.user.token, imagesencode, [], textEditingController.text);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const Text('Tạo bài viết'),
            IconButton(
              icon: const Icon(Icons.post_add),
              tooltip: 'Post',
              onPressed: () {
                uploadpost();
              },
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
                          widget.user.avatarModel.fileName)
                      .image,
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    controller: textEditingController,
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
                children:
                    // Card(
                    //   elevation: 10,
                    //   child: _imageFile!.path != 'assets/images/image.jpg'
                    //       ? Image.file(Io.File(_imageFile!.path))
                    //       : Container(),
                    // ),
                    images.map((e) {
                  var card =
                      new Card(elevation: 10, child: Image.file(Io.File(e)));
                  return card;
                }).toList()
                // Card(
                //   elevation: 10,
                //   child: Image.network(image_urls[1]),
                // ),
                // Card(
                //   elevation: 10,
                //   child: Image.network(image_urls[0]),
                // )
                ,
              ),
            )),
            const Divider(height: 10.0, thickness: 0.5),
            Container(
              height: 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton.icon(
                      onPressed: () {
                        takePhoto(ImageSource.gallery);
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
