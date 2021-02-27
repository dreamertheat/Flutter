import 'package:flutter/material.dart';
import 'package:udemy/blocs/ValidationBloc.dart';
import 'package:udemy/src/LoginSTLWidget.dart';

import 'blocs/BlocProviderSpecial.dart';

void main() {
  runApp(Master());
}


class Master extends StatelessWidget {

  @override
  //method 2 generic blocprovider
  Widget build(BuildContext context) {
    return BlocProviderSpecial<ValidationBloc>(
      bloc: ValidationBloc(),
      child: MaterialApp(
          title:"LOGIN",
          home: Scaffold(
              appBar:AppBar(title: Text("LOGIN")),
              body: LoginScreen())
      ),
    );

  }
  /*
  //method 1
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

  }*/
}



