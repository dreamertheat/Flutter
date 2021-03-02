import 'dart:convert';

import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sql.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import 'package:udemy/data/NewsAPI/NewsItemModel.dart';


class DBProvider{

  Database db;

  init() async{
    Directory dir = await getApplicationDocumentsDirectory();
    final path = join(dir.path,"Database .db");
    db = await openDatabase(
      path,
      version:1,
      onCreate: (Database newDb, int version){
        newDb.execute("""
        CREATE TABLE "News" (
          "_id"	INTEGER,
          "time"	INTEGER,
          "parents"	INTEGER,
          "score"	INTEGER,
          "deleted"	INTEGER,
          "dead"	INTEGER,
          "type"	TEXT,
          "by"	TEXT,
          "text"	TEXT,
          "title"	TEXT,
          "url"	TEXT,
          "kids"	BLOB,
          PRIMARY KEY("_id" AUTOINCREMENT)
        );
        """);
      }
    );
  }

  fetchItemModels(id) async{

    final maps = await db.query(
      "News",
      columns: null,
      where: "id=?",
      whereArgs: [id],
    );

    if(maps.length>0){
      return NewsItemModel.fromDB(maps.first);
    }
    return null;
  }


   addItem(NewsItemModel item) async{

    final result = await db.insert("News", item.toDBMap());

    return result.toInt();
  }



}