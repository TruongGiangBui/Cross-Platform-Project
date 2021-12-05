import 'package:intl/intl.dart';
class Post {
  final dynamic images;
  final dynamic videos;
  final dynamic likes;
  final dynamic countComments;
  final dynamic isLike;
  final dynamic id;
  final dynamic described;
  final dynamic createAt;
  final dynamic updateAt;
  final dynamic authorid;
  final dynamic authorname;
  final dynamic authoravt;

  Post(
      {this.images,
      this.videos,
      this.likes,
      this.countComments,
      this.isLike,
      this.id,
      this.described,
      this.createAt,
      this.updateAt,
      this.authorid,
      this.authorname,
      this.authoravt});
     
  factory Post.fromJson(Map<dynamic, dynamic> json) {
    return Post(
        images: json['images'],
        videos: json['videos'],
        likes: json['like'],
        countComments: json['countComments'],
        isLike: json['isLike'],
        id: json['_id'],
        described: json['described'],
        createAt: json['createdAt'],
        updateAt: json['updateAt'],
        authorid: json['author']['_id'],
        authorname: json['author']['username'],
        authoravt: json['author']['avatar']['fileName']);
  }
}

