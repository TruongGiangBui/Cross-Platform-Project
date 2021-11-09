import 'dart:convert';

import 'package:app/model/registerform.dart';
import 'package:app/model/registerresponse.dart';
import 'package:http/http.dart' as http;

Future<RegisterResponse> register(RegisterForm registerForm) async {
  final response = await http.post(
    Uri.parse('http://10.0.2.2:8000/api/v1/users/register'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': registerForm.username,
      'phonenumber': registerForm.phonenumber,
      'password': registerForm.password
    }),
  );

  if (response.statusCode == 201) {
    return RegisterResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(jsonDecode(response.body)['message']);
  }
}
