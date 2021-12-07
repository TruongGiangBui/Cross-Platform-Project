import 'dart:io';
import 'package:app/model/user.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../edit_profile.dart';


class ProfileWidget extends StatelessWidget {
  final User user;
  final bool isEdit;
  final VoidCallback onClicked;

  const ProfileWidget({
      required this.user,
      this.isEdit=false,
      required this.onClicked,
  });
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return Center(
      child: Stack(
        children: [
          buildImage(user.avatarModel.fileName),
          Positioned(
            bottom: 0,
            right: 4,
            child: InkWell(
              onTap: this.onClicked,
              child: buildEditIcon(color),
            )
          )
        ],
      ),
    );
  }
    Widget buildEditIcon(Color color) => buildCircle(
      color: Colors.white,
      all: 3,
      child: buildCircle(
        color: color,
        all: 8,
        child: Icon(
          this.isEdit ? Icons.add_a_photo: Icons.edit,
          color: Colors.white,
          size: 20,
        ),
      ),
    );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),

      );

  Widget buildImage(String fileName){
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: NetworkImage('http://10.0.2.2:8000/files/$fileName'),
          fit: BoxFit.cover,
          width: 128,
          height: 128,
        ),
      ),
    );


  }

}


