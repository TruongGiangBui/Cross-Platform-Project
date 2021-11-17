import 'dart:ffi';

class Post {
  final dynamic images;
  final  dynamic videos;
  final  dynamic likes;
  final int countComments;
  final bool? isLike;
  final String? id;
  final String? described;
  final DateTime? createAt;
  final DateTime? updateAt;
  final int? v;
  final Author author;
  Post(
      {required this.images,
      required this.videos,
      required this.likes,
      required this.countComments,
      required this.isLike,
      required this.id,
      required this.described,
      required this.createAt,
      required this.updateAt,
      required this.v,
      required this.author});
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        images:  json['data']['images'],
        videos: json['data']['videos'],
        likes: json['data']['likes'],
        countComments: json['data']['countComments'],
        isLike: json['data']['isLike'],
        id: json['data']['_id'],
        described: json['data']['described'],
        createAt: DateTime(json['data']['createAt']),
        updateAt: DateTime(json['data']['updateAt']),
        v: json['data']['__v'],
        author: Author(
            id: json['data']['author']['_id'],
            phonenumber: json['data']['author']['phonenumber'],
            username: json['data']['author']['username'],
            avatar: Avatar(
                fileName: json['data']['author']['avatar']['fileName'],
                id: json['data']['author']['avatar']['_id'])));
  }
}

class Author {
  final String? id;
  final String? phonenumber;
  final String? username;
  final Avatar? avatar;
  Author(
      {required this.id,
      required this.phonenumber,
      required this.username,
      required this.avatar});
}

class Avatar {
  final String? id;
  final String? fileName;
  Avatar({required this.id, required this.fileName});
}
