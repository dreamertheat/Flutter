import 'dart:convert';

import 'package:flutter/material.dart';


//newsAPI
class NewsItemModel{

final int id, time, parent, score, descendants;
final bool deleted, dead;
final String type, by, text, title, url;
final List<dynamic> kids;


Map<String, dynamic> toDBMap(){

  return <String, dynamic>{

    "id":id,"time":time,"parent":parent,"score":score,"descendants":descendants,"deleted":deleted?1:0,"dead":dead?1:0,
    "type":type,"by":by,"text":text,"title":title,
    "kids" : jsonEncode(kids)

  };


}


NewsItemModel.fromDB(Map<String, dynamic> parsedJson)
    : id = parsedJson['id'],
      time = parsedJson['time'],
      parent = parsedJson['parent'],
      url = parsedJson['url'],
      score = parsedJson['score'],
      descendants = parsedJson['descendants'],
      deleted = parsedJson['deleted']==1,
      dead = parsedJson['dead']==1,
      type = parsedJson['type'],
      by = parsedJson['by'],
      text = parsedJson['text'],
      title = parsedJson['title'],
      kids = jsonDecode(parsedJson['kids']);

  NewsItemModel.fromJson(Map<String, dynamic> parsedJson)
    : id = parsedJson['id'],
     time = parsedJson['time'],
     parent = parsedJson['parent'],
     url = parsedJson['url'],
     score = parsedJson['score'],
     descendants = parsedJson['descendants'],
     deleted = parsedJson['deleted'],
     dead = parsedJson['dead'],
     type = parsedJson['type'],
     by = parsedJson['by'],
     text = parsedJson['text'],
     title = parsedJson['title'],
     kids = parsedJson['kids'];

@override
  String toString() {
    return 'ItemModel{id: $id, time: $time, parent: $parent, score: $score, descendants: $descendants, deleted: $deleted, dead: $dead, type: $type, by: $by, text: $text, title: $title, url: $url, kids: $kids}';
  }
}