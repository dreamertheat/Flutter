

import 'dart:async';
import 'package:udemy/data/NewsAPI/NewsItemModel.dart';
import 'package:udemy/resources/LocalDatabase/DbProvider.dart';
import 'package:udemy/resources/NewsAPI/NewsApiProvider.dart';

import 'dart:io';


class Repository{

    DBProvider dbProvider = DBProvider();
    NewsApiProvider newsApiProvider = NewsApiProvider();

    Future<List<int>>fetchIds(){
      return newsApiProvider.fetchTopIds();
    }

    Future<NewsItemModel>fetchItems(int id) async{

      NewsItemModel item = await dbProvider.fetchItemModels(id);
      if(item!=null){
        return item;
      }
      item = await newsApiProvider.fetchItemsById(id);
      dbProvider.addItem(item);

      return item;


    }


}