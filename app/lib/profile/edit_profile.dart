import 'package:app/model/user.dart';
import 'package:app/profile/widget/profile_widget.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  final User user;
  const EditProfile({Key? key, required this.user}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    User currentUser = widget.user;
    TextEditingController nameController =
        TextEditingController(text: currentUser.name);
    TextEditingController ageController =
        TextEditingController(text: currentUser.age.toString());
    TextEditingController phoneNumberController =
        TextEditingController(text: currentUser.phoneNumber);
    TextEditingController sexController =
        TextEditingController(text: currentUser.sex);

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.green,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32),
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            user: currentUser,
            isEdit: true,
            onClicked: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Tên",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          TextField(
              obscureText: false,
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: "Tên",
              ),
              maxLines: 1),
          const SizedBox(height: 8),
          Text(
            "Tuổi",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          TextField(
              obscureText: false,
              controller: ageController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: "Tuổi",
              ),
              maxLines: 1),
          const SizedBox(height: 8),
          Text(
            "Điện thoại",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          TextField(
              obscureText: false,
              controller: phoneNumberController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: "Điện thoại",
              ),
              maxLines: 1),
          const SizedBox(height: 8),
          Text(
            "Giới tính",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          TextField(
              obscureText: false,
              controller: sexController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: "Giới tính",
              ),
              maxLines: 1),
          // TextFieldWidget(label: 'Tên',
          //     text: currentUser.name,
          //     onChanged: (name) {}
          // ),
          // const SizedBox(height: 20,),
          // TextFieldWidget(label: 'Tuổi',
          //     text: currentUser.age.toString(),
          //     onChanged: (age) {}
          // ),
          // const SizedBox(height: 20,),
          // TextFieldWidget(label: 'Điện thoại',
          //     text: currentUser.phoneNumber,
          //     onChanged: (phoneNumber) {}
          // ),
          // const SizedBox(height: 20,),
          // TextFieldWidget(label: 'Giới tính',
          //     text: currentUser.sex,
          //     onChanged: (sex) {}
          // ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlineButton(
                padding: EdgeInsets.symmetric(horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "Cancel",
                  style: TextStyle(
                      fontSize: 14, letterSpacing: 2.2, color: Colors.blue),
                ),
              ),
              RaisedButton(
                onPressed: () {},
                color: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "Save",
                  style: TextStyle(
                      fontSize: 14, letterSpacing: 2.2, color: Colors.white),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
