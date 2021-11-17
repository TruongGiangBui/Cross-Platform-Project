import 'dart:ffi';

class User {
  final String id;
  final String phonenumber;
  final String username;
  final String token;
  final String gender;
  final AvatarModel avatarModel;
  final CoverImageModel coverImageModel;
  final List blockedinbox;
  final List blockeddiary;
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

  factory User.fromJson(Map<String, dynamic> jsonData) {
    // print(jsonData);
    // print(jsonData['data']['_id']);
    print(jsonData['data']['blocked_diary']);
    print(jsonData['data']['blocked_inbox']);
    return User(
        id: jsonData['data']['_id'],
        phonenumber: jsonData['data']['phonenumber'],
        username: jsonData['data']['username'],
        token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IktoYW5oIiwiaWQiOiI2MTg3ZDhhYmU1NGViMDAwMWFlMTc4NTAiLCJpYXQiOjE2MzcwODA2MDN9.toyl7h4gx04Vl4XG5v_3jumccUjFMVDoaQDG-x0VuS8",
        gender: jsonData['data']['gender'],
        avatarModel: AvatarModel(
            type: jsonData['data']['avatar']['type'],
            id: jsonData['data']['avatar']['_id'],
            fileName: jsonData['data']['avatar']['fileNname']),
        coverImageModel: CoverImageModel(
            type: jsonData['data']['cover_image']['type'],
            id: jsonData['data']['cover_image']['_id'],
            fileName: jsonData['data']['cover_image']['fileNname']),
        blockeddiary: jsonData['data']['blocked_diary'].toList(),
        blockedinbox: jsonData['data']['blocked_inbox'].toList()
    ) ;
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
