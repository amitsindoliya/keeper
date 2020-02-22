
import 'dart:io';

class Entries {
  final int token;
  final String name;
  final DateTime date;
  final String items;
  final File userImage;

  Entries(
    this.token,
    this.name,
    this.items,
    this.date,
    this.userImage
  );
}
