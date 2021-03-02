import 'package:udemy/data/NewsAPI/NewsItemModel.dart';
import 'package:udemy/resources//NewsAPI/NewsApiProvider.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:flutter_test/flutter_test.dart';


void main(){

  test('fetchTopIds must return integer',() async{
     final api= NewsApiProvider();
     api.c = MockClient((request) async{
       return Response(json.encode([1,23,4,5,5]),200);
     });

     final ids = await api.fetchTopIds();


     expect(ids, [1,23,4,5,5]);

  });


  test('fetchItemsById should return ItemModel',() async{
    final api= NewsApiProvider();



    final mock = {"id":1,"time":11,"parent":1,"score":2,"descendants":1,"deleted":true,"dead":true,
      "type":"new","by":"procopio","text":"kalbo","title":"ownage",
      "kids" : [1,3,4,5,6,7]
    };

    final x = jsonEncode(mock);
    NewsItemModel m = NewsItemModel.fromJson(jsonDecode(x));

    api.c = MockClient((request) async{



      return Response(json.encode(mock),200);
    });

    final ids = await api.fetchItemsById(3);


    expect(ids.toString(), m.toString());

  });



}
