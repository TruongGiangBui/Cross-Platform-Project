import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatCard {
  List<String> member;
  String type;
  String id;
  String createAt;
  String updateAt;
  int v;

  ChatCard({
    required this.member, required this.type, required this.id, required this.createAt, required this.updateAt, required this.v,
  });

}

class ListChats {

  List<ChatCard> listChats = [];
  ListChats({required this.listChats});

  factory ListChats.fromJson(Map<String, dynamic> json) {
    List<ChatCard> listChat = [];
    for (var data in json['data']) { //data is Map<String, dynamic>
      listChat.add(ChatCard(
          member: data['member'],
          type: data['type'],
          id: data['_id'],
          v: data['__v'],
          createAt: data['createAt'],
          updateAt: data['updateAt']
      ));
    }
    return ListChats(listChats: listChat);
  }
}

// Future<ListChats> getChats() async {
//   final response = await http.post(
//     Uri.parse('http://localhost:8001/api/v1/chats/getChats/61752df79ba82c3677e0f072'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//       'Accept': 'application/json',
//       'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImdpYW5nIGJ1aSIsImlkIjoiNjE3NTJkZjc5YmE4MmMzNjc3ZTBmMDcyIiwiaWF0IjoxNjM2NTA3NjcyfQ.H2P43Eb_3yv2ICVpzSWQFcsehOep3w4gtGbyCvRf_hA',
//     }
//   );
//   print(response.statusCode);
//   if (response.statusCode == 200) {
//     return ListChats.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception(jsonDecode(response.body)['message']);
//   }
// }
//
// void main() {
//   var a = getChats();
//   print(a);
// }

