import 'package:flutter/material.dart';
import 'package:udemy/blocs/ValidationBloc.dart';
import 'package:udemy/blocs/BlocProvider.dart';

class LoginScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final bloc = BlocProvider.of(context);

    return Container(
      margin: EdgeInsets.all(20.0),
      child:Column(
        children: [
          //emailField(),
          emailField(bloc),
          passwordField(bloc),
          Container(margin: EdgeInsets.all(10.0),),
          submitButton(bloc)

        ],

      )

    );
  }
}

Widget emailField(bloc){

  return StreamBuilder(
    stream: bloc.email,
    builder: (context, snapshot) {
      return TextField(
        onChanged: (string){
            bloc.emailChange(string);
        },
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          errorText: snapshot.error,
          hintText: "email@email.com",
          labelText: "Email Address"
        ),
      );
    }
  );

}

Widget passwordField(bloc){

  return StreamBuilder(
    stream: bloc.password,
    builder: (context, snapshot) {
      return TextField(
        onChanged: (string){
          bloc.passwordChange(string);
        },
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            errorText: snapshot.error,
            hintText: "atleast 5 char",
            labelText: "password"
        ),
      );
    }
  );

}

Widget submitButton(bloc){
  return RaisedButton(
    child: Text("LOGIN"),
    color: Colors.amber,
    onPressed: (){
      bloc.dispose();
  },);
}
