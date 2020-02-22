import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as Path;


import '../models/Entries.dart';

class AddEntries extends StatefulWidget {
  
  final List<Entries> entriesList;
  final Function entryIn;

  AddEntries(this.entriesList, this.entryIn);

  @override
  _AddEntriesState createState() => _AddEntriesState();
}

class _AddEntriesState extends State<AddEntries> {
  final tokenController = TextEditingController();

  final nameController = TextEditingController();

  final itemController = TextEditingController();
  String _userImage;
  File localImage;
  bool _isImage = false;

  void getImage() async {
    File image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image == null) return;

    // final directory = await getApplicationDocumentsDirectory();
    // final String path = directory.path;
    // var fileName = Path.basename(image.path);
    // final File imagePath = await image.copy('$path/$fileName');
    _isImage = true;
    setState(() {
      _userImage = image.path;
      print("$image");
    });
  }

  Widget buildTextField(title, textController, icon) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
      child: TextField(
        style: TextStyle(color: Colors.red),
        textAlign: TextAlign.left,
        controller: textController,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.red,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 15),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.yellowAccent,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          hintText: title,
          hintStyle: TextStyle(
            color: Colors.red,
          ),
        ),
        onSubmitted: (val) => widget.entryIn(
            tokenController.text,
            nameController.text,
            itemController.text,
            DateTime.now(),
            _userImage),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Divider(),
          Text(
            "Add Someone",
            style: TextStyle(color: Colors.red, fontSize: 25),
          ),
          Divider(),
          Container(
            child: _isImage
                ? GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      backgroundImage: AssetImage(_userImage),
                    ),
                  )
                : InkWell(
                    onTap: getImage,
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.red,
                      child: Icon(
                        Icons.account_circle,
                        color: Colors.white,
                        size: 70,
                      ),
                    ),
                  ),
          ),
          Divider(),
          buildTextField("Token", tokenController, Icons.confirmation_number),
          buildTextField("Name", nameController, Icons.person_add),
          buildTextField("Items", itemController, Icons.account_balance_wallet),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: BorderSide(color: Colors.red),
                ),
                color: Colors.red,
                onPressed: () => widget.entryIn(
                    tokenController.text,
                    nameController.text,
                    itemController.text,
                    DateTime.now(),
                    _userImage),
                child: Text(
                  "SUBMIT",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
