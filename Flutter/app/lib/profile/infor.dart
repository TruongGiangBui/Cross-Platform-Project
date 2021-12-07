import 'package:app/profile/edit_profile.dart';
import 'package:flutter/material.dart';
import 'widget/profile_widget.dart';
import 'package:app/model/user.dart';

class Information extends StatelessWidget {
  final User user;
  Map<String,String> mapGender = {'secret':'None','male':'Nam','female':'Nữ'};
  Information({required this.user});
  @override
  Widget build(BuildContext context) {
    print(this.user.username);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.green,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        children: <Widget>[
          ProfileWidget(user: this.user,
            onClicked: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> EditProfile(user: this.user)),
                );
            },
          ),
          SizedBox(height: 50,),
          Divider(
            height: 10,
            thickness: 0.5,
          ),
          showInforUser(this.user)
        ]
      ),
    );
  }
  Widget showInforUser(User user) => Column(
    children: [
      ListTile(
        minVerticalPadding: 2,
        title: Text('Tên zalo'+' '*(30 - 8) +'${user.username}'),
      ),
      Divider(
        height: 10,
        thickness: 0.5,
      ),
      ListTile(
        minVerticalPadding: 2,
        title: Text('Giới tính'+' '*(30 - 7) +'${mapGender[user.gender]}'),
      ),
    ],
  );
}
