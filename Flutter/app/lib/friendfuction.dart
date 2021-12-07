import 'package:app/model/friend.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<dynamic> setrequestfriend(String token, dynamic receiver_id) async {
  final response = await http.post(
      Uri.parse('http://10.0.2.2:8000/api/v1/friends/set-request-friend'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{"user_id": receiver_id}));

  var data = jsonDecode(response.body);
  return data;
  /*{
    "code": 200,
    "success": false,
    "message": "Đã gửi lời mời kết bạn trước đó"
} */
}

Future<List<Friend>> getrequestfriend(String token) async {
  final response = await http.get(
      Uri.parse('http://10.0.2.2:8000/api/v1/friends/get-requested-friend'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

  var data = jsonDecode(response.body)['data']['friends'];
  List<Friend> friends = [];
  data.forEach((element) {
    Friend friend = Friend.fromJson(element);
    friends.add(friend);
  });
  return friends;
}

Future<dynamic> setacceptfriend(String token, dynamic receiverid) async {
  final response = await http.post(
      Uri.parse('http://10.0.2.2:8000/api/v1/friends/set-accept'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(
          <String, dynamic>{"user_id": receiverid.toString(), "is_accept": "1"}));

  var data = jsonDecode(response.body);
  return data;
  /*
  {
    "code": 200,
    "message": "Kết bạn thành công",
    "data": {
        "_id": "618b25a96ba6431a5824932a",
        "sender": "618b246c6ba6431a5824931f",
        "receiver": "61752df79ba82c3677e0f072",
        "status": "1",
        "createdAt": "2021-11-10T01:51:37.799Z",
        "updatedAt": "2021-11-10T01:54:50.221Z",
        "__v": 0
    },
    "success": true
}
  */
}

Future<List<Friend>> getlistfriend(String token) async {
  final response = await http.get(
      Uri.parse('http://10.0.2.2:8000/api/v1/friends/list'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

  var data = jsonDecode(response.body)['data']['friends'];
  List<Friend> friends = [];
  // print(response.body);
  data.forEach((element) {
    Friend friend = Friend.fromJson(element);
    friends.add(friend);
  });
  return friends;
}
