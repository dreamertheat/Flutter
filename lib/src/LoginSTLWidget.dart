import 'package:flutter/material.dart';
import 'package:udemy/blocs/ValidationBloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child:Column(
        children: [
          emailField(),
          passwordField(),
          Container(margin: EdgeInsets.all(10.0),),
          submitButton()

        ],
      )

    );
  }
}

Widget emailField(){

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

Widget passwordField(){

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

Widget submitButton(){
  return RaisedButton(
    child: Text("LOGIN"),
    color: Colors.amber,
    onPressed: (){
    
  },);
}
