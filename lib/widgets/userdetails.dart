import 'package:flutter/material.dart';
import 'package:keeper/models/Entries.dart';

class UserDetails extends StatelessWidget {
  final DateTime userDate;
  final List<Entries> userList;
  final Function entryOut;
  MediaQueryData queryData;

  UserDetails({this.userDate, this.userList, this.entryOut});
  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    var user = userList.firstWhere((user) {
      return user.date == userDate;
    });
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        elevation: 0,
        title: Text("${user.token}"),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: queryData.size.height*0.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(user.userImage),
                ),
              ),
            ),
            Divider(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Column(
                children: <Widget>[
                  Divider(),
                  Text(
                    "Name: ${user.name}",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 26,
                    ),
                  ),
                  Divider(),
                  Text(
                    "Items: ${user.items}",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                    ),
                  ),
                  Divider(),
                  Text(
                    "Token No.: ${user.token}",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                    ),
                  ),
                  Divider(),
                ],
              ),
            ),
            Divider(),
            FloatingActionButton.extended(
              onPressed: () {
                entryOut(user.date);
                Navigator.of(context).pop();
              },
              backgroundColor: Colors.white,
              label: Text(
                "Delete",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                ),
              ),
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
