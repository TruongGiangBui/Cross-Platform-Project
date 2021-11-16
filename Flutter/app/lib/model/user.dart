import 'dart:ffi';

class User {
  final String? id;
  final String? phonenumber;
  final String? username;
  final String? token;
  final String? gender;
  final AvatarModel avatarModel;
  final CoverImageModel coverImageModel;
  final Array blockedinbox;
  final Array blockeddiary;
  User(
      {required this.id,
      required this.phonenumber,
      required this.username,
      required this.token,
      required this.gender,
      required this.avatarModel,
      required this.coverImageModel,
      required this.blockedinbox,
      required this.blockeddiary});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['data']['_id'],
        phonenumber: json['data']['phonenumber'],
        username: json['data']['username'],
        token: "",
        gender: json['data']['gender'],
        avatarModel: AvatarModel(
            type: json['data']['avatar']['type'],
            id: json['data']['avatar']['_id'],
            fileName: json['data']['avatar']['fileNname']),
        coverImageModel: CoverImageModel(
            type: json['data']['cover_image']['type'],
            id: json['data']['cover_image']['_id'],
            fileName: json['data']['cover_image']['fileNname']),
        blockeddiary: json['data']['blocked_diary'],
        blockedinbox: json['data']['blocked_inbox']);
  }
}

class AvatarModel {
  final String? type;
  final String? id;
  final String? fileName;
  AvatarModel({required this.type, required this.id, required this.fileName});
}

class CoverImageModel {
  final String? type;
  final String? id;
  final String? fileName;
  CoverImageModel(
      {required this.type, required this.id, required this.fileName});
}
