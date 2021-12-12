import 'dart:convert';
import 'dart:io' as Io;
import 'package:app/model/user.dart';
import 'package:app/server/server.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  final User user;
  const EditProfile({Key? key, required this.user}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  Map<String,String> mapGender = {'secret':'None','male':'Nam','female':'Nữ'};
  Map<String,String> reverseGender = {'None':'secret', 'Nam':'male','Nữ':'female'};
  List<String> listGender = ['None', 'Nam', 'Nữ'];
  String? value = "";
  late PickedFile? _imageFile = PickedFile('assets/images/image.jpg');
  final ImagePicker _picker = ImagePicker();

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
      updatePhoto(base64, widget.user.token);
      Navigator.pop(context);
    });
  }

  Widget bottomSheet(){
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Chọn ảnh làm profile",
            style: TextStyle(
              fontSize: 20.0
            )
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.camera),
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                label: Text("Camera"),
              ),
              FlatButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                label: Text("Gallery"),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget imageProfile(){
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 80.0,
          backgroundImage: _imageFile!.path == 'assets/images/image.jpg' ? NetworkImage('http://10.0.2.2:8000/files/${widget.user.avatarModel.fileName}'): FileImage(Io.File(_imageFile!.path)) as ImageProvider
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: Icon(
              Icons.camera_alt,
              color: Colors.blue,
              size: 28.0,
            ),
          ),
        ),
      ]),
    );
  }


  @override
  Widget build(BuildContext context) {
    User currentUser = widget.user;
    print(_imageFile!.path);
    TextEditingController nameController = TextEditingController(text: currentUser.username);
    if(this.value == ""){
      this.value = mapGender[currentUser.gender];
    }

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.green,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32),
        physics: BouncingScrollPhysics(),
        children: [
          imageProfile(),
          const SizedBox(height: 20,),
          Text(
            "Tên",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          TextField(
              obscureText: false,
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: "Tên",
              ),
              maxLines: 1
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Giới tính",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              DropdownButton<String>(
                value: this.value,
                items: listGender.map(
                        (String item) => DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(fontSize: 14),
                      ),
                    )
                ).toList(),
                onChanged:(newValue){
                  setState(() {
                    this.value=newValue;
                  });
                },
              ),
            ],
          ),

          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlineButton(
                padding: EdgeInsets.symmetric(horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "Cancel",
                  style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 2.2,
                      color: Colors.blue
                  ),

                ),
              ),
              RaisedButton(
                onPressed: () async {
                  Map<String,String> dataChange={};
                  if(nameController.text != currentUser.username){
                    dataChange['username'] = nameController.text;
                    currentUser.setUsername = nameController.text;
                  }
                  if(this.value != mapGender[currentUser.gender]){
                    if(this.value !=null) {
                      dataChange['gender'] = reverseGender[this.value]!;
                    }
                  }
                  showDialog(context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Cập nhật thông tin "),
                        content: Text("Bạn có muốn thay đổi thông tin cá nhân không?"),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("ok"),
                            onPressed: () async {
                              print(dataChange);
                              bool result = false;
                              if (dataChange.length>0) {
                                result = await changeProfile(dataChange, currentUser.token);
                              }
                              if(result==true){
                                Navigator.pop(context);
                                Navigator.pop(context);
                                if(dataChange['gender'] != null){
                                  String? gender = dataChange['gender'];
                                  widget.user.setGender = gender!;
                                }
                                print("Change information success");

                              }
                              else{
                                Navigator.pop(context);
                                Navigator.pop(context);
                                print("update fail");
                              }
                            },
                          ),
                          FlatButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text("Cancel")
                          )
                        ],
                      )
                  );

                },
                color: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "Save",
                  style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 2.2,
                      color: Colors.white
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

