import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as Path;

enum Choice { YES, NO }

class UserImage extends StatefulWidget {
  @override
  _UserImageState createState() => _UserImageState();
}

class _UserImageState extends State<UserImage> {
  File _userImage;
  File localImage;
  bool _isImage = false;
  Choice _choiceValue = Choice.YES;

  void getImage() async {
    File image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image == null) return;

    final directory = await getApplicationDocumentsDirectory();
    final String path = directory.path;
    var fileName = Path.basename(image.path);
    final File localImage = await image.copy('$path/$fileName');
    _isImage = true;
    setState(() {
      _userImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _isImage
          ? GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                backgroundImage: FileImage(_userImage),
              ),
            )
          : InkWell(
              onTap: getImage,
              child: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.account_circle,
                  color: Colors.red,
                  size: 70,
                ),
              ),
            ),
    );
  }
}
