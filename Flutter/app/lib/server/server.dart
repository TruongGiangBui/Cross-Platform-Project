import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:app/model/response_signin.dart';

// Future<String> getTokenId(String phoneNumber, String password, String username) async{
//   var data = {
//     'phonenumber': phoneNumber,
//     'password': password,
//     'username': username
//   };
//   var header = {
//     'content-type': "application/json"
//   };
//
//   var response = await http.post(
//       Uri.http('10.0.2.2:8000', '/api/v1/users/login'),
//       body: json.encode(data),
//       headers: header
//   );
//   if(response.statusCode==200){
//     ResponseSignIn res = responseFromJson(response.body);
//     return res.token;
//   }
//   return "";
// }

Future<bool> updatePhoto(String baseEncode64, String token) async{
  var data = {
    "avatar": baseEncode64
  };
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

  // if(dataChange['description']!=null){
  //   data['description'] = dataChange['description'];
  // }
  //
  // if(dataChange['address']!=null){
  //   data['address'] = dataChange['address'];
  // }
  //
  // if(dataChange['city']!=null){
  //   data['city'] = dataChange['city'];
  // }
  //
  // if(dataChange['country']!=null){
  //   data['country'] = dataChange['country'];
  // }

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