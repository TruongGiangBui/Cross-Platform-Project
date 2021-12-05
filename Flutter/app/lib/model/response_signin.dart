import 'dart:convert';

class ResponseSignIn {
  late Data data;
  late String token;

  ResponseSignIn({required this.data,required this.token});

  factory ResponseSignIn.fromJson(Map<String, dynamic> json) => ResponseSignIn(
    data : (json['data'] != null ? new Data.fromJson(json['data']) : null)!,
    token :json['token']
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class Data {
  late String id;
  late String phonenumber;
  late String username;

  Data({required this.id,required this.phonenumber,required this.username});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id : json['id'],
    phonenumber : json['phonenumber'],
    username : json['username'],
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phonenumber'] = this.phonenumber;
    data['username'] = this.username;
    return data;
  }
}

ResponseSignIn responseFromJson(String str) => ResponseSignIn.fromJson(json.decode(str));
String responseToJson(ResponseSignIn response) => json.encode(response.toJson());