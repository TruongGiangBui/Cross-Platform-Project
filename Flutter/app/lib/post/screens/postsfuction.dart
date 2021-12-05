import 'package:app/model/post.dart';
import 'package:http/http.dart' as http;

Future<List<Post>> getlistpost(String token) async {
  final response = await http.get(
      Uri.parse('http://10.0.2.2:8000/api/v1/posts/list'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
  print(response.body);
  List<Post> posts = new List.empty();
  return posts;
}
