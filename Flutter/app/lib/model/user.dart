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

  void set setToken(String newtoken) {
    token = newtoken;
  }
  void setUsername(String value) => this.username=value;
}


class AvatarModel {
   String? type;
   String? id;
   String? fileName;
  AvatarModel({required this.type, required this.id, required this.fileName});
}

class CoverImageModel {
   String? type;
   String? id;
   String? fileName;
  CoverImageModel(
      {required this.type, required this.id, required this.fileName});
}
