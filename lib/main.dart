import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "keeper",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Keeper"),
          backgroundColor: Colors.red,
          elevation: 0.0,
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Text("Line 1"),
              Text("Line 2")
            ],
          ),
        ),
      ),
    );
  }
}
