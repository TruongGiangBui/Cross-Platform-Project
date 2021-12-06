import 'package:app/model/comment.dart';
import 'package:app/post/postsfuction.dart';
import 'package:app/post/widgets/widgets.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:app/model/user.dart';
import 'package:app/model/post.dart';

class RequestWidget extends StatefulWidget {
  // final User user;
  // const RequestWidget({Key? key, required this.user})
  //     : super(key: key);

  @override
  _RequestWidgetState createState() => _RequestWidgetState();
}

class _RequestWidgetState extends State<RequestWidget> {
  // final formKey = GlobalKey<FormState>();

  List filedata = [
    {
      'name': 'Adeleye Ayodeji',
      'pic': 'https://picsum.photos/300/30',
      'message': '24-12-2021'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': '24-12-2021'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': '24-12-2021'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': '24-12-2021'
    },
  ];

  Widget requestChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          // id = data[i];
          Padding(
              padding: const EdgeInsets.fromLTRB(2.0, 0.0, 2.0, 0.0),
              child: Column(
                children: [
                  ListTile(
                    leading: GestureDetector(
                      onTap: () async {
                        // Display the image in large form.
                        print("Comment Clicked");
                      },
                      child: Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: new BoxDecoration(
                            color: Colors.blue,
                            borderRadius:
                                new BorderRadius.all(Radius.circular(50))),
                        child: CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                NetworkImage(data[i]['pic'] + "$i")),
                      ),
                    ),
                    title: Text(
                      data[i]['name'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(data[i]['message']),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 2.0, 0.0),
                        child: TextButton(
                            onPressed: () => print('Accept'),
                            child: Text('Accept'),
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.deepPurpleAccent),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(2.0, 0.0, 0.0, 0.0),
                        child: TextButton(
                            onPressed: () => setState(() {
                                  data.removeAt(i);
                                }),
                            child: Text('Delete'),
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.grey),
                            )),
                      ),
                    ],
                  )
                ],
              ))
      ],
    );

    //return ListView(
    //   children: [
    //     for (var i = 0; i < data.length; i++)
    //       Padding(
    //         padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
    //         child: ListTile(
    //           leading: GestureDetector(
    //             onTap: () async {
    //               // Display the image in large form.
    //               print("Comment Clicked");
    //             },
    //             child: Container(
    //               height: 50.0,
    //               width: 50.0,
    //               decoration: new BoxDecoration(
    //                   color: Colors.blue,
    //                   borderRadius: new BorderRadius.all(Radius.circular(50))),
    //               child: CircleAvatar(
    //                   radius: 50,
    //                   backgroundImage: NetworkImage(data[i]['pic'] + "$i")),
    //             ),
    //           ),
    //           title: Text(
    //             data[i]['name'],
    //             style: TextStyle(fontWeight: FontWeight.bold),
    //           ),
    //           subtitle: Text(data[i]['message']),
    //         ),
    //       )
    //   ],
    // );

    // return FutureBuilder<List<Comment>>(
    //   future: getlistcomment(widget.user.token, widget.post.id),
    //   builder: (context, AsyncSnapshot snapshot) {
    //     if (snapshot.hasData) {
    //       List<Comment> data = snapshot.data;
    //       return ListView(
    //         children: [
    //           for (var i = 0; i < data.length; i++)
    //             Padding(
    //               padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
    //               child: ListTile(
    //                 leading: GestureDetector(
    //                   onTap: () async {
    //                     // Display the image in large form.
    //                     print("Comment Clicked");
    //                   },
    //                   child: Container(
    //                     height: 50.0,
    //                     width: 50.0,
    //                     decoration: new BoxDecoration(
    //                         color: Colors.blue,
    //                         borderRadius:
    //                             new BorderRadius.all(Radius.circular(50))),
    //                     child: CircleAvatar(
    //                         radius: 50,
    //                         backgroundImage:
    //                             NetworkImage("http://10.0.2.2:8000/files/"+data[i].authoravt.toString())),
    //                   ),
    //                 ),
    //                 title: Text(
    //                   data[i].authorname,
    //                   style: TextStyle(fontWeight: FontWeight.bold),
    //                 ),
    //                 subtitle: Text(data[i].content),
    //               ),
    //             )
    //         ],
    //       );
    //     } else if (snapshot.hasError) {
    //       return Container();
    //     }
    //     return Center(
    //       child: Container(
    //         width: 50,
    //         height: 50,
    //         child: CircularProgressIndicator(),
    //       ),
    //     );
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Friend Requests"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(child: requestChild(filedata)),
    );
  }
}
