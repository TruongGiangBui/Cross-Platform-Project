import 'package:flutter/material.dart';
import 'package:app/model/post.dart';
import 'setting_post.dart';

class Profile extends StatelessWidget {
  final double coverImageHeight = 300;
  final double profileHeight = 50;
  @override
  Widget build(BuildContext context) {
    final Post postTemp = Post(
        name: "Đào Minh Khánh",
        content: "Bầu Trời đẹp quá",
        imagePath: 'assets/images/1.png');

    return Scaffold(
      appBar: AppBar(
        title: Text("My Post"),
        centerTitle: true,
        leading: IconButton(
          icon: BackButton(),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PostSetting(
                            post: postTemp,
                          )));
            },
          )
        ],
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildTop(postTemp),
          buildContent(postTemp),
        ],
      ),
    );
  }

  Widget buildTop(Post post) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: profileHeight + 10),
          child: buildCoverImage(),
        ),
        Positioned(
          top: coverImageHeight - profileHeight,
          child: buildProfileImage(post),
        ),
      ],
    );
  }

  Widget buildContent(Post post) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          post.name,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget buildProfileImage(Post post) {
    return CircleAvatar(
      radius: profileHeight,
      backgroundColor: Colors.grey.shade800,
      backgroundImage: Image.asset(post.imagePath).image,
    );
  }

  Widget buildCoverImage() {
    return Container(
      color: Colors.grey,
      child: Image.network(
        'https://cdn.pixabay.com/photo/2021/09/17/03/24/forest-6631518_960_720.jpg',
        width: double.infinity,
        height: coverImageHeight,
        fit: BoxFit.cover,
      ),
    );
  }
}
