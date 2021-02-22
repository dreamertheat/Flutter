import 'package:flutter/material.dart';
import 'package:udemy/src/LoginSTLWidget.dart';
import 'src/LoginWidget.dart';
void main() {
  runApp(Udemy());
}


class Udemy extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(title:"LOGIN",home:
    Scaffold(appBar:AppBar(title: Text("LOGIN")),body: Container(child: LoginScreen())));
  }
}



