import 'package:flutter/material.dart';
import 'package:udemy/data/ImageModel.dart';


class ImageList extends StatelessWidget {

  final List<ImageModel> im;
  ImageList(this.im);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return buildImage(index);
    }, itemCount: im.length);
  }

  buildImage(index){
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade900,width: 2.0)),
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(20.0),
      child: Column(children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Image.network(im[index].url.toString()),
        ),
        Text(im[index].title)
      ],),
    );
  }
}

