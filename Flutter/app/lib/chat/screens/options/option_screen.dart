import 'package:flutter/material.dart';
import 'package:app/chat/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:app/model/user.dart';

class Option {
  final String option;
  final String description;

  const Option(this.option, this.description);
}

class OptionScreen extends StatelessWidget {
  const OptionScreen({
    Key? key,
    required this.options,
    required this.user
  }) : super(key: key);
  final User user;
  final List<Option> options;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView.builder(
        itemCount: options.length,
        itemBuilder: (context, index) {
          return ListTile(
            trailing: Icon(Icons.person),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: kPrimaryColor, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            title: Text(options[index].option),
            onTap: () => showDialog<String> (
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: Text(options[index].option),
                content: Text(options[index].description),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),

                  TextButton(
                    onPressed: ()=> Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  )
                ],
              )
            ),
          );
        },
      ),
    );
  }

  AppBar buildAppBar(){
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const BackButton(),
          const SizedBox(width: kDefaultPadding * 0.75,),
          const Text('Tùy chọn'),
        ],
      ),
      backgroundColor: kPrimaryColor,
    );
  }

}



