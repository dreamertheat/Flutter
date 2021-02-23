import 'package:flutter/material.dart';
import 'package:udemy/blocs/Bloc.dart';
import 'package:udemy/blocs/ValidationBloc.dart';
class BlocProvider extends InheritedWidget implements Bloc{

  final bloc = ValidationBloc();

  BlocProvider({Key key, Widget child}): super(key:key,child: child);

  bool updateShouldNotify(_){
    return true;
  }

  static Bloc of(BuildContext context){
    return (context.dependOnInheritedWidgetOfExactType<BlocProvider>() as BlocProvider).bloc;

    //return (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider).bloc;
  }


  @override
  void dispose() {
    bloc.dispose();
  }


}