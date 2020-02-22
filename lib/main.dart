import 'package:flutter/material.dart';

import './widgets/startWidget.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "keeper",
      
      home: Scaffold(
        appBar: AppBar(
          title: Text("Keeper"),
          backgroundColor: Colors.red,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: StartWidget(),
        ),
      ),
    );
  }
}
