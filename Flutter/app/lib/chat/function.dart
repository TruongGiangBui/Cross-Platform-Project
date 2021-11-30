import 'package:app/model/chat.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Chat>> getlistchats(String token) async {
  print(token);
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
  return chats;
}
