import 'dart:ffi';

class User {
   dynamic id;
   dynamic phonenumber;
   dynamic username;
    String token;
   dynamic gender;
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
        id: json['data']['_id'],
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

  set setToken(String newToken){
    token = newToken;
  }

  set setUsername(String userName){
    username = userName;
  }

  void set setGender(String gender){
    gender = gender;
  }

}

class AvatarModel {
   dynamic type;
   dynamic id;
   dynamic fileName;
  AvatarModel({required this.type, required this.id, required this.fileName});
}

class CoverImageModel {
   dynamic type;
   dynamic id;
   dynamic fileName;
  CoverImageModel(
      {required this.type, required this.id, required this.fileName});
}