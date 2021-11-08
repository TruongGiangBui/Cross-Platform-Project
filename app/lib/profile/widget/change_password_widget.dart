import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ChangePasswordWidget extends StatefulWidget {
  const ChangePasswordWidget({Key? key}) : super(key: key);

  @override
  _ChangePasswordWidgetState createState() => _ChangePasswordWidgetState();
}
Future changePassword(String currentPassword, String newPassword) async{
  var response = await http.post(
    Uri.http('localhost:8080', '/api/v1/users/change-password'),
    body: {currentPassword : currentPassword, newPassword : newPassword}
  );
  if(response.statusCode == 201){
    print("Success");
  }
}
class _ChangePasswordWidgetState extends State<ChangePasswordWidget> {
  bool showPassword = true;
  TextEditingController currentPasswordController = TextEditingController(text: "");
  TextEditingController newPasswordController = TextEditingController(text: "");
  TextEditingController reNewPasswordController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
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
                onPressed: (){

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
