import 'package:flutter/material.dart';
import 'setting_profile.dart';
import 'package:app/model/user.dart';

class Profile extends StatelessWidget {
  final double coverImageHeight = 300;
  final double profileHeight = 50;
  @override
  Widget build(BuildContext context) {

    final User userTemp = User(name: "Đào Minh Khánh",
        age: 20,
        phoneNumber: '0366928050',
        sex: 'Male',
        imagePath: 'assets/images/image.jpg');

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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>ProfileSetting(user: userTemp,))
              );
            },
          )
        ],
        backgroundColor:  Colors.deepPurple,
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildTop(userTemp),
          buildContent(userTemp),
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
        Text(user.name,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
  Widget buildProfileImage(User user){
    return CircleAvatar(
      radius: profileHeight,
      backgroundColor: Colors.grey.shade800,
      backgroundImage: Image.asset(user.imagePath).image,

    );
  }

  Widget buildCoverImage(){
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
