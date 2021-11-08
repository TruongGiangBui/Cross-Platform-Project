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
      'username':registerForm.username,
      'phonenumber': registerForm.phonenumber,
      'password':registerForm.password
    }),
  );
  print(jsonDecode(response.body));
  if (response.statusCode == 200) {
    return RegisterResponse.fromJson(jsonDecode(response.body));
  } else {
    return new RegisterResponse(id: "", phonenumber: "", username: jsonDecode(response.body)['message'], token: "",coverImageModel:new CoverImageModel(fileName: '',id: '',type: ''),avatarModel:new  AvatarModel(fileName: '',id: '',type: ''));
  }
}
