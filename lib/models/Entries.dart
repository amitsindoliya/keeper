
import 'dart:io';

class Entries {
  int token;
  String name;
  DateTime date;
  String items;
  String userImage;

  Entries(
    this.token,
    this.name,
    this.items,
    this.date,
    this.userImage
  );

  Map<String,dynamic> toMap(){
    var map=Map<String,dynamic>();
    map['token']=token;
    map['name']=name;
    map['date']=date;
    map['items']=items;
    map['userImage']=userImage;

    return map;
  }

  Entries.fromMapObject(Map<String,dynamic> map) {
    this.token=map['token'];
    this.name=map['name'];
    this.date=map['date'];
    this.items=map['items'];
    this.userImage=map['userImage'];
  }
}
