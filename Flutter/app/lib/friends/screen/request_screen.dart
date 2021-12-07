import 'package:app/friendfuction.dart';
import 'package:flutter/material.dart';
import 'package:app/model/user.dart';
import 'package:app/model/friend.dart';

class RequestWidget extends StatefulWidget {
  final User user;
  const RequestWidget({Key? key, required this.user}) : super(key: key);

  @override
  _RequestWidgetState createState() => _RequestWidgetState();
}

class _RequestWidgetState extends State<RequestWidget> {
  // final formKey = GlobalKey<FormState>();

  Widget requestChild(user) {
    final Future<List<Friend>> friends = getrequestfriend(widget.user.token);
    return FutureBuilder<List<Friend>>(
        future: friends,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Friend> data = snapshot.data;
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
                              },
                              child: Container(
                                height: 50.0,
                                width: 50.0,
                                decoration: new BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: new BorderRadius.all(
                                        Radius.circular(50))),
                                child: CircleAvatar(
                                    radius: 50,
                                    backgroundImage: NetworkImage(
                                        "http://10.0.2.2:8000/files/" +
                                            data[i].avt.toString())),
                              ),
                            ),
                            title: Text(
                              data[i].username,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 0.0, 2.0, 0.0),
                                child: TextButton(
                                    onPressed: () => setState(() {
                                          setacceptfriend(
                                              widget.user.token, data[i].id);
                                          data.removeWhere((friend) =>
                                              friend.id == data[i].id);
                                        }),
                                    child: Text('Accept'),
                                    style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.deepPurpleAccent),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    2.0, 0.0, 0.0, 0.0),
                                child: TextButton(
                                    onPressed: () => setState(() {
                                          data.removeWhere((friend) =>
                                              friend.id == data[i].id);
                                        }),
                                    child: Text('Delete'),
                                    style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.grey),
                                    )),
                              ),
                            ],
                          )
                        ],
                      ))
              ],
            );
          } else if (snapshot.hasError) {
            return Container();
          }
          return Center(
            child: Container(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Friend Requests"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(child: requestChild(widget.user)),
    );
  }
}
