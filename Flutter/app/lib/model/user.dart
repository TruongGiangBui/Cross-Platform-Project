import 'dart:ffi';

class User {
  String id;
  String phonenumber;
  String username;
  String token;
  String gender;
  AvatarModel avatarModel;
  CoverImageModel coverImageModel;
  List<dynamic> blockedinbox;
  List<dynamic> blockeddiary;
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
        id: json['data']['id'],
        phonenumber: json['data']['phonenumber'],
        username: json['data']['username'],
        token: "",
        gender: json['data']['gender'],
        avatarModel: AvatarModel(
            type: json['data']['avatar']['type'],
            id: json['data']['avatar']['_id'],
            fileName: json['data']['avatar']['fileName']),
        coverImageModel: CoverImageModel(
            type: json['data']['cover_image']['type'],
            id: json['data']['cover_image']['_id'],
            fileName: json['data']['cover_image']['fileName']),
        blockeddiary: json['data']['blocked_diary'],
        blockedinbox: json['data']['blocked_inbox']);
  }

  void set setToken(String newToken){
    token = newToken;
  }

  void set setUsername(String userName){
    username = userName;
  }

  void set setGender(String gender){
    gender = gender;
  }

}

class AvatarModel {
  String? type;
  String? id;
  String fileName;
  AvatarModel({required this.type, required this.id, required this.fileName});
}

class CoverImageModel {
  String? type;
  String? id;
  String fileName;
  CoverImageModel(
      {required this.type, required this.id, required this.fileName});
}