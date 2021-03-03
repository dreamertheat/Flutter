import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:udemy/data/NewsAPI/NewsItemModel.dart';
class NewsApiProvider{
  final _urlBASE = "https://hacker-news.firebaseio.com/v0/";
  final urlIDS = "topstories.json";
  final urlItems ="item/";

  Client c = Client();

  Future<List<int>>fetchTopIds() async{
    final response = await c.get(_urlBASE+urlIDS);
    final List<dynamic>json= jsonDecode(response.body);
    return json.cast<int>();
  }

  Future<NewsItemModel> fetchItemsById(int id) async{
    final response = await c.get(_urlBASE+urlItems+"$id/.json");
    final json = jsonDecode(response.body);
    return NewsItemModel.fromJson(json);
  }

}