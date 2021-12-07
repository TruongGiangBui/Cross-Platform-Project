import 'package:app/chat/screens/chats/chats_screen.dart';
import 'package:app/friends/screen/friendslist_screen.dart';
import 'package:app/friends/screen/request_screen.dart';
import 'package:app/friends/screen/search_screen.dart';
import 'package:app/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:app/model/user.dart';

class NavBarContainer extends StatelessWidget {
  final User currentUser;
  const NavBarContainer({Key? key, required this.currentUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(currentUser.avatarModel.fileName);
    return Container(
        color: Colors.white,
        child: Column(
          children: [
            const Divider(height: 10.0, thickness: 0.5),
            Container(
              height: 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton.icon(
                      onPressed: () => {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    FriendListWidget(user: currentUser)))
                          },
                      icon: const Icon(
                        Icons.people,
                        color: Colors.green,
                      ),
                      label: Text('Ban be')),
                  VerticalDivider(width: 11.0),
                  TextButton.icon(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                               RequestWidget( user: currentUser)));
                      },
                      icon: const Icon(
                        Icons.people,
                        color: Colors.green,
                      ),
                      label: Text('Ket ban')),
                  VerticalDivider(width: 11.0),
                  TextButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                Profile(user: currentUser)));
                      },
                      icon: const Icon(
                        Icons.message,
                        color: Colors.green,
                      ),
                      label: Text('Thong tin')),
                ],
              ),
            )
          ],
        ));
  }
}
