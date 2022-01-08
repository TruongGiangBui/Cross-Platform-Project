import 'package:app/account/Screens/login/login.dart';
import 'package:app/model/user.dart';
import 'package:app/profile/widget/change_password_widget.dart';
import 'package:flutter/material.dart';
import 'infor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileSetting extends StatelessWidget {
  final User user;
  const ProfileSetting({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User currentUser = this.user;
    return Scaffold(
        appBar: AppBar(
          title: Text(this.user.username),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Thông tin"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Information(
                              user: currentUser,
                            )));
              },
            ),
            Divider(
              height: 10,
              thickness: 0.5,
            ),
            // ListTile(
            //   title: Text("Đổi ảnh bìa "),
            //   onTap: (){
            //     print("Đổi ảnh bìa ");
            //   },
            // ),
            Divider(
              height: 10,
              thickness: 0.5,
            ),
            ListTile(
              title: Text("Thay đổi mật khẩu"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ChangePasswordWidget(
                          currentUser: user,
                        )));
              },
            ),
            Divider(
              height: 10,
              thickness: 0.5,
            ),
            ListTile(
              title: Text("Logout"),
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.remove('token');
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
            Divider(
              height: 10,
              thickness: 0.5,
            ),
          ],
        ));
  }
}
