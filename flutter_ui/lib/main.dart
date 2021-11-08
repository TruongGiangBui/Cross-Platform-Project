import 'package:flutter/material.dart';
import 'Screens/login/login.dart';
import 'Screens/register/register.dart';
import 'Screens/setting/logout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF2661FA),
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SettingsPage(), //change this variable to RegisterScreen for Register UI or LoginScreen for Login UI
    );
  }
}
