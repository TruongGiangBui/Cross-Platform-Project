class RegisterResponse {
  final String? id;
  final String? phonenumber;
  final String? username;
  final String? token;
  final AvatarModel avatarModel;
  final CoverImageModel coverImageModel;
  RegisterResponse(
      {required this.id,
      required this.phonenumber,
      required this.username,
      required this.token,
      required this.avatarModel,
      required this.coverImageModel});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
        id: json['data']['id'],
        phonenumber: json['data']['phonenumber'],
        username: json['data']['username'],
        token: json['token'],
        avatarModel: AvatarModel(
            type: json['data']['avatar']['type'],
            id: json['data']['avatar']['_id'],
            fileName: json['data']['avatar']['fileNname']),
        coverImageModel: CoverImageModel(
            type: json['data']['cover_image']['type'],
            id: json['data']['cover_image']['_id'],
            fileName: json['data']['cover_image']['fileNname']));
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
