import 'dart:convert';
import 'package:app/model/user.dart';
import 'package:http/http.dart' as http;

Future<bool> changepassword(
    String token, dynamic oldpass, dynamic newpass) async {
  final response = await http.post(
      Uri.parse('http://10.0.2.2:8000/api/v1/users/change-password'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        "currentPassword": oldpass,
        "newPassword": newpass
      }));
  if (response.statusCode == 200) return true;
  return false;
}

Future<User> getuser(String token, dynamic userid) async {
  final response = await http.get(
      Uri.parse('http://10.0.2.2:8000/api/v1/users/show/' + userid),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
  User user = User.fromJson(jsonDecode(response.body)['data']);
  return user;
}

Future<bool> setblockuser(String token, dynamic userId) async {
  final response = await http.post(
      Uri.parse('http://10.0.2.2:8000/api/v1/users/set-block-user'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        "user_id": "618b246c6ba6431a5824931f",
        "type": true
      }));
  if (response.statusCode == 200) return true;
  return false;
}

Future<List<User>> searchUser(String token, dynamic keyword) async {
  final response =
      await http.post(Uri.parse('http://10.0.2.2:8000/api/v1/users/search'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(<String, dynamic>{"keyword": keyword}));
  List<User> users = [];
  var data = jsonDecode(response.body)['data'];
  data.forEach((element) {
    User user = User.fromJson(element);
    users.add(user);
  });
  return users;
}
