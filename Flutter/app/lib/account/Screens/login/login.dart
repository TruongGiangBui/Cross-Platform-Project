import 'dart:convert';

import 'package:app/account/Screens/login/loadingscreen.dart';
import 'package:app/model/loginform.dart';
import 'package:app/model/loginresponse.dart';
import 'package:app/model/user.dart';
import 'package:app/post/screens/NewsFeed.dart';
import 'package:flutter/material.dart';
import 'package:app/account/Screens/register/register.dart';
import 'package:app/account/components/background.dart';
import 'package:app/account/Screens/login/loginfunction.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  void showAlert(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text(message),
            ));
  }

  @override
  Widget build(BuildContext context) {
    // bool load = false;
    // if (!load)
    //   SharedPreferences.getInstance().then((value) {
    //     load = true;
    //     String token = value.getString('token').toString();
    //     if (token!=null||token!='') {
    //       Navigator.of(context).push(
    //         MaterialPageRoute(
    //             builder: (context) =>
    //                 Loading(token: token)),
    //       );
    //     }
    //   });
    Size size = MediaQuery.of(context).size;
    TextEditingController phoneController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();
    return Scaffold(
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "LOGIN",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2661FA),
                    fontSize: 36),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: phoneController,
                decoration: InputDecoration(labelText: "Phone number"),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Text(
                "Forgot your password?",
                style: TextStyle(fontSize: 12, color: Color(0XFF2661FA)),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: RaisedButton(
                onPressed: () async {
                  if (phoneController.text == ''||passwordController.text=='') {
                    showAlert(context, "Vui lòng nhập đủ thông tin");
                    return;
                  }
                  var userdata = await login(new LoginForm(
                      phonenumber: phoneController.text,
                      password: passwordController.text));

                  SharedPreferences.getInstance().then((prefs) {
                    prefs.setString('token', userdata.token);
                  });
                  getUser(userdata.token).then((value) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => NewsFeed(user: value)),
                    );
                  }).catchError((err) {
                    showAlert(context, '$err');
                    print(err);
                  });
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(0),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: size.width * 0.5,
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(80.0),
                      gradient: new LinearGradient(colors: [
                        Color.fromARGB(255, 255, 136, 34),
                        Color.fromARGB(255, 255, 177, 41)
                      ])),
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    "LOGIN",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: GestureDetector(
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()))
                },
                child: Text(
                  "Don't Have an Account? Sign up",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2661FA)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
