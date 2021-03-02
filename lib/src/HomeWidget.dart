import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:udemy/data/Imagery/ImageModel.dart';
import 'package:udemy/widgets/ImageList.dart';
class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() {
    return
      _HomeWidgetState();
  }
}

class _HomeWidgetState extends State<HomeWidget> {

  int x = 0 ;
  String message;
  List<ImageModel> images = [];
  void fetcher() async{

    x++;
    var result = await get('https://jsonplaceholder.typicode.com/photos/$x');
    ImageModel im = ImageModel.fromJson(result.body);


    setState(() {
      images.add(im);
      message = im.toString();
    });


  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {

              fetcher();

          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          shadowColor: Color(Colors.amber.shade50.red) ,
        ),
        body: ImageList(images),
        drawer: Drawer(),
      ),
    );
  }
}
