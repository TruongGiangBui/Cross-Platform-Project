import 'dart:convert';
import 'package:app/model/friend.dart';
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
  User user = User.fromJson(jsonDecode(response.body));
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
      body: jsonEncode(<String, dynamic>{"user_id": userId, "type": true}));
  if (response.statusCode == 200) return true;
  return false;
}

Future<String> getChatWithUser(String token, dynamic userId) async {
  final response = await http.get(
      Uri.parse('http://10.0.2.2:8000/api/v1/chats/getChatwithuser/' + userId),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
  var chatid = jsonDecode(response.body)['data'].toString();
  if (chatid != null && chatid != '') {
    return chatid;
  } else
    return '';
}

Future<List<Friend>> searchUser(String token, dynamic keyword) async {
  final response =
      await http.post(Uri.parse('http://10.0.2.2:8000/api/v1/users/search'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(<String, dynamic>{"keyword": keyword}));
  List<Friend> users = [];
  var data = jsonDecode(response.body)['data'];
  data.forEach((element) {
    Friend user = Friend.fromJson(element);
    users.add(user);
    print(user);
  });
  return users;
}
