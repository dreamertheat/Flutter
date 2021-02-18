import 'dart:convert';

class ImageModel{

  int id, albumId;
  String title, thumbnailUrl, url;

  ImageModel(id,albumId,title,thumbnailUrl,url);
  ImageModel.fromJson(String s){
    var g  = json.decode(s);

    id=g["id"];albumId=g["albumId"];title =g["title"];
    thumbnailUrl =g["thumbnailUrl"];url=g["url"];
  }

  @override
  String toString() {
    return 'ImageModel{id: $id, albumId: $albumId, title: $title, thumbnailUrl: $thumbnailUrl, url: $url}';
  }
}