import 'dart:convert';

import 'package:app/model/loginform.dart';
import 'package:app/model/loginresponse.dart';
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
  print(response.statusCode);
  if (response.statusCode == 200) {
    return LoginResponse.fromJson(jsonDecode(response.body));
  } else {
    return new LoginResponse(id: "", phonenumber: "", username: "", token: "");
  }
}
