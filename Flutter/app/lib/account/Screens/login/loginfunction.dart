import 'dart:convert';

import 'package:app/model/loginform.dart';
import 'package:app/model/loginresponse.dart';
import 'package:app/model/user.dart';
import 'package:http/http.dart' as http;

Future<LoginResponse> login(LoginForm loginForm) async {
  final response = await http.post(
    Uri.parse('http://10.0.2.2:8000/api/v1/users/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'phonenumber': loginForm.phonenumber,
      'password': loginForm.password
    }),
  );
  // print(response.statusCode);
  if (response.statusCode == 200) {
    return LoginResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(jsonDecode(response.body)['message']);
  }
}

Future<User> getUser(String token) async {
  final response = await http.get(
      Uri.parse('http://10.0.2.2:8000/api/v1/users/show'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
  if (response.statusCode == 200) {
    User user = User.fromJson(jsonDecode(response.body));
    user.setToken = token;
    return user;
  } else {
    throw Exception(jsonDecode(response.body)['message']);
  }
}
