import 'package:flutter/material.dart';
import 'package:path/path.dart' as Path;
import 'package:sqflite/sqflite.dart';

import '../models/Entries.dart';
import 'addEntries.dart';
import 'entrieslist.dart';

class StartWidget extends StatefulWidget {
  @override
  _StartWidgetState createState() => _StartWidgetState();
}

class _StartWidgetState extends State<StartWidget> {
  final List<Entries> entriesList = [];
  MediaQueryData queryData;
  
  void entryIn(token, name, item, date, image) {
    final newEntry = Entries(
      int.parse(token),
      name,
      item,
      date,
      image,
    );
    setState(() {
      entriesList.add(newEntry);
      print(entriesList);
    });

    Navigator.of(context).pop();
  }

  void entryOut(date) {
    var delIndex = entriesList.indexWhere((entry) => entry.date == date);
    setState(() {
      entriesList.removeAt(delIndex);
      print(entriesList);
    });
  }

  void modalScreen(BuildContext ctx) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        backgroundColor: Colors.white,
        isScrollControlled: true,
        context: ctx,
        builder: (ctx) {
          return Container(
            height: queryData.size.height*0.7,
              child: AddEntries(entriesList, entryIn),
            );
        });
  }

  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    return Container(
      color: Colors.red,
      height: queryData.size.height,
      child: Column(
        children: <Widget>[
          Entrieslist(entriesList, entryOut),
          FloatingActionButton(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.add,
              color: Colors.red,
            ),
            onPressed: () => modalScreen(context),
          )
        ],
      ),
    );
  }
}
