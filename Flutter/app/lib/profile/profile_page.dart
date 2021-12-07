import 'package:app/server/server.dart';
import 'package:flutter/material.dart';
import 'setting_profile.dart';
import 'package:app/model/user.dart';
import 'dart:convert';


class Profile extends StatelessWidget {
  final double coverImageHeight = 300;
  final double profileHeight = 50;
  final User user;
  Profile({required this.user});
  
  @override
  Widget build(BuildContext context) {

    // final User this.user = User.fromJson({
    //   "data": {
    //     "gender": "secret",
    //     "blocked_inbox": [],
    //     "blocked_diary": [],
    //     "_id": "6187d8abe54eb0001ae17850",
    //     "phonenumber": "0366928055",
    //     "username": "Khanh",
    //     "avatar": {
    //       "type": "other",
    //       "_id": "60c39f54f0b2c4268eb53367",
    //       "fileName": "avatar_2.png"
    //     },
    //     "cover_image": {
    //       "type": "other",
    //       "_id": "60c39eb8f0b2c4268eb53366",
    //       "fileName": "defaul_cover_image.jpg"
    //     }
    //   }
    // }
    // );
    return Scaffold(

      appBar: AppBar(
        title: Text("My profile"),
        centerTitle: true,
        leading: IconButton(
          icon: BackButton(),
          onPressed: () {  },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () async {
              print("Token id: ${this.user.token}");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>ProfileSetting(user: this.user,))
              );
            },
          )
        ],
        backgroundColor:  Colors.deepPurple,
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildTop(this.user),
          buildContent(this.user),
        ],
      ),
    );
  }

  Widget buildTop(User user){
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: profileHeight+10),
          child: buildCoverImage(),
        ),
        Positioned(
          top:coverImageHeight - profileHeight,
          child: buildProfileImage(user),
        ),
      ],
    );
  }
  Widget buildContent(User user){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(user.username,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
  Widget buildProfileImage(User user){
    String fileName = user.avatarModel.fileName;
    String url = 'http://10.0.2.2:8000/files/' + fileName;
    return CircleAvatar(
      radius: profileHeight,
      backgroundColor: Colors.grey.shade800,
      // backgroundImage: Image.asset('assets/images/image.jpg').image,
      backgroundImage: NetworkImage(url),
    );
  }

  Widget buildCoverImage(){
    String fileName = user.coverImageModel.fileName;
    String url = 'http://10.0.2.2:8000/files/' + fileName;

    return Container(
        color: Colors.grey,
        child: Image.network(
            url,
            width: double.infinity,
          height: coverImageHeight,
          fit: BoxFit.cover,
        ),
    );

  }

}
