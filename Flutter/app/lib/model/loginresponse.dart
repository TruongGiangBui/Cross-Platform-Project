class LoginResponse {
  final String id;
  final String phonenumber;
  final String username;
  final String token;
  LoginResponse(
      {required this.id,
      required this.phonenumber,
      required this.username,
      required this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
        id: json['data']['id'],
        phonenumber: json['data']['phonenumber'],
        username: json['data']['username'],
        token: json['token']);
  }
}
