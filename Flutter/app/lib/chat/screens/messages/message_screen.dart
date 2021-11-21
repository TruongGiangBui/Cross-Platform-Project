import 'package:app/chat/constants.dart';
import 'package:flutter/material.dart';
import 'package:app/chat/screens/messages/components/body.dart';

import 'package:app/chat/screens/options/option_screen.dart';
import 'package:app/chat/screens/options/components/options.dart';

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: kPrimaryColor,
      title: Row(
        children: [
          const BackButton(),
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/user_2.png"),
          ),
          const SizedBox(width: kDefaultPadding * 0.75,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Dinh Thang",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Active 3m ago",
                style: TextStyle(fontSize: 12),
              )
            ],
          )
        ],
      ),
      actions: [
        IconButton(onPressed: (){}, icon: const Icon(Icons.local_phone)),
        IconButton(onPressed: (){}, icon: const Icon(Icons.videocam)),
        IconButton(onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OptionScreen(options: optionsDEMO,),
          )
        ), icon: const Icon(Icons.dehaze_sharp)),
        const SizedBox(width: kDefaultPadding / 2,)
      ],
    );
  }

}