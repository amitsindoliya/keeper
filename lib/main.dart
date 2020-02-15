import 'package:flutter/material.dart';
import './models/Entries.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Entries> entriesList = [
      Entries(11, "Amit", "wallet", DateTime.now()),
      Entries(12, "Cakey", "cakes", DateTime.now())
    ];

    return MaterialApp(
      title: "keeper",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Keeper"),
          backgroundColor: Colors.red,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  hintText: "Token Number",
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Name",
                ),
              ),
              Container(
                height: 500,
                padding: EdgeInsets.all(10),
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Card(
                      elevation: 1.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          
                          Container(
                            height:60,
                            child: CircleAvatar(
                              radius: 30,
                              child: Text(
                                "${entriesList[index].token}",
                              ),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                "${entriesList[index].name}",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${entriesList[index].items}",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: entriesList.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
