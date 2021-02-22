import 'package:flutter/material.dart';


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

  return TextField(
    onChanged: (String){

    },
    keyboardType: TextInputType.emailAddress,
    obscureText: true,
    decoration: InputDecoration(
      errorText: "Invalid Email",
      hintText: "email@email.com",
      labelText: "Email Address"
    ),
  );

}

Widget passwordField(){

  return TextField(
    onChanged: (String){

    },
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
        errorText: "invalid password",
        hintText: "atleast 5 char",
        labelText: "password"
    ),
  );

}

Widget submitButton(){
  return RaisedButton(
    child: Text("LOGIN"),
    color: Colors.amber,
    onPressed: (){
    
  },);
}
