import 'package:flutter/material.dart';

import './userdetails.dart';
import '../models/Entries.dart';

class Entrieslist extends StatelessWidget {
  final List<Entries> entriesList;
  final Function entryOut;
  MediaQueryData queryData;
  Entrieslist(this.entriesList, this.entryOut);

  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    return Container(
      width: double.infinity,
      height: 600,
      padding: EdgeInsets.all(10),
      child: (entriesList.length != 0)
          ? ListView.builder(
              itemBuilder: (ctx, index) {
                return Container(
                  height: queryData.size.height*0.1,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(3),
                  margin: EdgeInsets.all(5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: FileImage(entriesList[index].userImage),
                    ),
                    title: Text(
                      "${entriesList[index].name}",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      "Token no: ${entriesList[index].token}",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      onPressed: () => entryOut(entriesList[index].date),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => UserDetails(
                                userDate: entriesList[index].date,
                                userList: entriesList,
                                entryOut: entryOut,
                              )));
                    },
                  ),
                );
              },
              itemCount: entriesList.length,
            )
          : Center(
              child:Text(
                "Add Someone to View list. For Adding Click on the '+' button Down!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
    );
  }
}
