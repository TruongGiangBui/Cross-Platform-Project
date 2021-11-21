import 'package:flutter/material.dart';
import 'package:app/chat/constants.dart';
import 'package:flutter/foundation.dart';

class Option {
  final String option;
  final String description;

  const Option(this.option, this.description);
}

class OptionScreen extends StatelessWidget {
  const OptionScreen({
    Key? key,
    required this.options
  }) : super(key: key);
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
            onTap: () {},
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



