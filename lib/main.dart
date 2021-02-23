import 'package:flutter/material.dart';
import 'package:udemy/src/LoginSTLWidget.dart';

import 'blocs/BlocProvider.dart';

void main() {
  runApp(Udemy());
}


class Udemy extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
          title:"LOGIN",
          home: Scaffold(
          appBar:AppBar(title: Text("LOGIN")),
          body: LoginScreen())
      ),
    );

  }
}



