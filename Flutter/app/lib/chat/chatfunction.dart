import 'package:app/model/chat.dart';
import 'package:app/model/message.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Chat>> getlistchats(String token) async {
  //print(token);
  final response = await http.get(
      Uri.parse('http://10.0.2.2:8000/api/v1/chats/getChats'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
  var data = jsonDecode(response.body)['data'];
  List<Chat> chats = [];
  // print(response.body);
  data.forEach((element) {
    Chat chat = Chat.fromJson(element);
    chats.add(chat);
  });
  //print(chats);
  return chats;
}

Future<List<Message>> getlistmessages(String token, dynamic chatid) async {
  //print(token);
  final response = await http.get(
      Uri.parse('http://10.0.2.2:8000/api/v1/chats/getMessages/' + chatid),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
  var data = jsonDecode(response.body)['data'];
  List<Message> messages = [];
  // print(response.body);
  data.forEach((element) {
    Message message = Message.fromJson(element);
    messages.add(message);
  });
  return messages;
}

Future<bool> sendmessage(
    dynamic token, dynamic receiver, dynamic chatid, dynamic content) async {
  final response =
      await http.post(Uri.parse('http://10.0.2.2:8000/api/v1/chats/send'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(<String, dynamic>{
            "chatId": chatid,
            "receivedId": receiver,
            "member": [receiver],
            "type": "PRIVATE_CHAT",
            "content": content
          }));
  if (response.statusCode == 200) return true;
  return false;
}
