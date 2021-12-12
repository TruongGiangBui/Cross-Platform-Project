import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:app/model/response_signin.dart';


Future<bool> updatePhoto(String baseEncode64, String token, [bool isAvatar=true]) async{
  var data = {};
  if(isAvatar){
   data['avatar'] = baseEncode64;
  }
  else{
    data['cover_image'] = baseEncode64;
  }
  print(data);
  var response = await http.post(
      Uri.http('10.0.2.2:8000', '/api/v1/users/edit'),
      body: json.encode(data),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      }
  );
  if(response.statusCode == 200){
    print("Change image success");
    return true;
  }
  print("Change image fall");
  return false;


}
Future<bool> changePassword(String currentPassword, String newPassword, String token) async{
  var data = {
    'currentPassword': currentPassword,
    'newPassword': newPassword
  };
  var response = await http.post(
    Uri.http('10.0.2.2:8000', '/api/v1/users/change-password'),
    body: json.encode(data),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    }
  );
  print(response.statusCode);

  if(response.statusCode==200){
    print("Change password success");
    return true;
  }
  return false;
}

Future<bool> changeProfile(Map<String, String>dataChange, String token) async{
  var data ={};
  if(dataChange['username']!=null){
    data['username'] = dataChange['username'];
  }

  if(dataChange['gender']!=null){
    data['gender'] = dataChange['gender'];
  }

  var response = await http.post(
      Uri.http('10.0.2.2:8000', '/api/v1/users/edit'),
      body: json.encode(data),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      }
  );
  if(response.statusCode==200){
    return true;
  }
  else{
    print(response.statusCode);
  }
  return false;
}