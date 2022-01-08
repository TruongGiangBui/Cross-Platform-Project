import 'package:app/model/comment.dart';
import 'package:app/model/post.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Post>> getlistpost(String token) async {
  final response = await http.get(
      Uri.parse('http://10.0.2.2:8000/api/v1/posts/list'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
  List<Post> posts = [];
  var data = jsonDecode(response.body)['data'];
  data.forEach((element) {
    Post post = Post.fromJson(element);
    posts.add(post);
  });
  return posts;
}

Future<Post> createpost(
    String token, dynamic images, dynamic videos, dynamic described) async {
  final response = await http.post(
      Uri.parse('http://10.0.2.2:8000/api/v1/posts/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        "images": images,
        "videos": videos,
        "described": described
      }));

  Post post = Post.fromJson(jsonDecode(response.body)['data']);
  return post;
}

Future<Post> getpost(String token, dynamic postId) async {
  final response = await http.get(
      Uri.parse('http://10.0.2.2:8000/api/v1/posts/show/' + postId),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
  Post post = Post.fromJson(jsonDecode(response.body)['data']);
  return post;
}

Future<bool> deletepost(String token, dynamic postId) async {
  final response = await http.get(
      Uri.parse('http://10.0.2.2:8000/api/v1/posts/delete/' + postId),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
  if (response.statusCode == 200) return true;
  return false;
}

Future<bool> likepost(String token, dynamic postId) async {
  final response = await http.post(
      Uri.parse(
          'http://10.0.2.2:8000/api/v1/postLike/action/' + postId.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
  if (response.statusCode == 200) return true;
  return false;
}
Future<bool> reportpost(String token, dynamic postId) async {
  final response = await http.post(
      Uri.parse(
          'http://10.0.2.2:8000/api/v1/postReport/create/' + postId.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
  if (response.statusCode == 200) return true;
  return false;
}
Future<List<Comment>> getlistcomment(String token, dynamic postId) async {
  final response = await http.get(
      Uri.parse('http://10.0.2.2:8000/api/v1/postComment/list/' + postId),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
  List<Comment> cmts = [];
  var data = jsonDecode(response.body)['data'];
  data.forEach((element) {
    Comment cmt = Comment.fromJson(element);
    cmts.add(cmt);
  });
  return cmts;
}

Future<bool> createComment(
    String token, dynamic postid, dynamic content) async {
  final response = await http.post(
      Uri.parse('http://10.0.2.2:8000/api/v1/postComment/create/' + postid),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(
          <String, dynamic>{"content": content, " commentAnswered": false}));

  if (response.statusCode == 200) return true;
  return false;
}
