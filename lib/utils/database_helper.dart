import 'dart:io';
import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/Entries.dart';


class DatabaseHelper{
  static DatabaseHelper _databaseHelper;    // Singleton DatabaseHelper
	static Database _database;                // Singleton Database

	String noteTable = 'entries_table';
	String colToken = 'token';
	String colName = 'Name';
	String colItems = 'Items';
	String colImage = 'image';
	String colDate = 'date';

  Future openDb() async {
    _database = await openDatabase(join(await getDatabasePath(),"entries.db"),
    version:1,
    onCreate:(Database db,int version) async {
await db.execute("Create table entries (token INTEGER,date Date primary key,Name TEXT,image )")
    });
  }
}