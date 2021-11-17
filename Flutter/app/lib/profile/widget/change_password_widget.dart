import 'package:app/model/user.dart';
import 'package:flutter/material.dart';
import 'package:app/server/server.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ChangePasswordWidget extends StatefulWidget {
  final User currentUser;
  const ChangePasswordWidget({Key? key, required this.currentUser}) : super(key: key);

  @override
  _ChangePasswordWidgetState createState() => _ChangePasswordWidgetState();
}

class _ChangePasswordWidgetState extends State<ChangePasswordWidget> {
  bool showPassword = true;
  TextEditingController currentPasswordController = TextEditingController(text: "");
  TextEditingController newPasswordController = TextEditingController(text: "");
  TextEditingController reNewPasswordController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    User user = widget.currentUser;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        backgroundColor: Colors.deepPurple,
        title: Text("Thay đổi mật khẩu"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32,vertical: 32),
        children: [
          Text(
            "Nhập mật khẩu cũ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          TextField(
            obscureText: showPassword,
            controller: currentPasswordController,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: (){
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: "Mật khẩu cũ",
            ),
            maxLines: 1
          ),
          const SizedBox(height: 20,),
          Text(
            "Nhập mật khẩu mới",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          TextField(
              obscureText: showPassword,
              controller: newPasswordController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: (){
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: "Nhập mật khẩu mới",
              ),
              maxLines: 1
          ),
          const SizedBox(height: 20,),
          Text(
            "Nhập mật lại khẩu mới",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          TextField(
              obscureText: showPassword,
              controller: reNewPasswordController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: (){
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: "Nhập lại mật khẩu mới",
              ),
              maxLines: 1
          ),
          const SizedBox(height: 30,),
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
                  String currentPassword = currentPasswordController.text;
                  String newPassword = newPasswordController.text;
                  String reNewPassword = reNewPasswordController.text;
                  print(currentPassword);
                  print(newPassword);
                  print(reNewPassword);
                  if (newPassword!= reNewPassword){
                    print("The new passowrd isn't match");
                    showDialog(
                        context: context,
                        builder: (context){
                          return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0)
                              ),
                              child: Stack(
                                overflow: Overflow.visible,
                                alignment: Alignment.topCenter,
                                children: [
                                  Container(
                                    height: 200,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                                      child: Column(
                                        children: [
                                          Text('Warning !!!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                          SizedBox(height: 5,),
                                          Text('Mật khẩu không khớp', style: TextStyle(fontSize: 20),),
                                          SizedBox(height: 20,),
                                          RaisedButton(onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                            color: Colors.red,
                                            child: Text('Okay', style: TextStyle(color: Colors.white),),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      top: -60,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.redAccent,
                                        radius: 60,
                                        child: Icon(Icons.assistant_photo, color: Colors.white, size: 50,),
                                      )
                                  ),
                                ],
                              )
                          );
                        }
                    );
                  }
                  else{
                    showDialog(context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Thay đổi mật khẩu"),
                          content: Text("Bạn có muốn thay đổi mật khẩu không"),
                          actions: <Widget>[
                            FlatButton(
                              child: Text("ok"),
                              onPressed: () async {
                                print("Token id: ${widget.currentUser.token}");
                                bool success = await changePassword(currentPassword, newPassword, widget.currentUser.token);
                                if(success==true){

                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  print("Change password success");
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

                  }

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
