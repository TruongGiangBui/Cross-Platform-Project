import 'dart:io' as Io;
import 'package:app/server/server.dart';
import 'package:flutter/material.dart';
import 'setting_profile.dart';
import 'package:app/model/user.dart';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  final double coverImageHeight = 300;
  final double profileHeight = 50;
  final User user;
  Profile({required this.user});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late PickedFile? _imageFile = PickedFile('assets/images/image.jpg');
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {

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
              print("Token id: ${widget.user.token}");
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>ProfileSetting(user: widget.user,))
              );
            },
          )
        ],
        backgroundColor:  Colors.deepPurple,
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildTop(widget.user),
          buildContent(widget.user),
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
          margin: EdgeInsets.only(bottom: widget.profileHeight+10),
          child: buildCoverImage(),
        ),
        Positioned(
          top:widget.coverImageHeight - widget.profileHeight,
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
      radius: widget.profileHeight,
      backgroundColor: Colors.grey.shade800,
      backgroundImage: NetworkImage(url),
    );
  }

  Widget buildCoverImage(){
    String fileName = widget.user.coverImageModel.fileName;
    bool isChange = false;
    String url = 'http://10.0.2.2:8000/files/' + fileName;
    if(_imageFile!.path != 'assets/images/image.jpg'){
      isChange=true;
    }

    return Container(
        color: Colors.grey,
        child: InkWell(
          onTap: (){
            showModalBottomSheet(
                context: context,
                builder: (context){
                  return Container(
                    height: 200,
                    child: Container(
                      child: _bottomWidget(),
                      decoration: BoxDecoration(
                        color: Theme.of(context).canvasColor,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(30),
                          topRight: const Radius.circular(30)
                        )
                      ),
                    ),
                  );
                }
            );
          },
          child: Container(
            // child: coverImage(isChange, url)
              child: isChange == false? Image.network(
                url,
                width: double.infinity,
                height: widget.coverImageHeight,
                fit: BoxFit.cover,
              ): Image.file(
                Io.File(_imageFile!.path),
                fit: BoxFit.cover,
                width: double.infinity,
                height: widget.coverImageHeight,
              )
          )
        )
    );

  }

  // Widget coverImage(bool isChange, String url){
  //   print(url);
  //   print(isChange);
  //   return BoxDecoration(
  //       image: DecorationImage(
  //           fit: BoxFit.cover,
  //           image: isChange == false?
  //           Image.network(
  //             url,
  //             // width: double.infinity,
  //             // height: widget.coverImageHeight,
  //             // fit: BoxFit.cover,
  //           ).image:
  //           FileImage(Io.File(_imageFile!.path))
  //       )
  //   );
  // }

  void takePhoto(ImageSource source) async{
    final pickedfile = await _picker.getImage(
        source: source,
        imageQuality: 40
    );
    setState(() {
      _imageFile = pickedfile!;
      print(_imageFile!.path);
      final bytes = Io.File(_imageFile!.path).readAsBytesSync();
      String path = _imageFile!.path;
      int lastDotIndex = path.lastIndexOf('.');
      String extension = path.substring(lastDotIndex+1, path.length);
      String base64 = 'data:image/$extension;base64,' + base64Encode(bytes);
      updatePhoto(base64, widget.user.token, false);
      Navigator.pop(context);
    });
  }

  Widget _bottomWidget(){
    return Column(
        children: <Widget>[
          SizedBox(height: 20,),
          Text(
              "Chọn ảnh ảnh nền",
              style: TextStyle(
                  fontSize: 20.0
              )
          ),
          SizedBox(height: 20,),
          Column(
            children: <Widget>[
              ListTile(
                  leading: Icon(Icons.camera),
                  title: Text("Chụp ảnh"),
                  onTap: (){
                    takePhoto(ImageSource.camera);
                  }
              ),
              ListTile(
                leading: Icon(Icons.source),
                title: Text("Lấy ảnh từ thư viện"),
                onTap: (){
                  takePhoto(ImageSource.gallery);
                },
              )
            ],

          ),
        ]
    );
  }
}