import 'package:flutter/material.dart';
import 'package:udemy/tools/Validators.dart';
import 'package:udemy/tools/Validators.dart';
class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> with Validators {

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(children: forms()),
      ),
    );
  }

  //form collection
  List<Widget> forms(){
    return [

      emailField(),
      passwordField(),
      Container(margin: EdgeInsets.only(top: 25.0),),
      submitButton()

    ];

  }

  Widget emailField(){

    return TextFormField(
      onSaved: (newValue) => print(newValue),
      validator: validateEmail,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email Address",
        hintText: "mail@gmail.com",

      ),
    );

  }

  Widget passwordField(){

    return TextFormField(
      onSaved: (newValue) => print(newValue),
      validator: validatePassword,
      keyboardType:
      TextInputType.emailAddress,
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "should contain letters, numbers and symbols",
      ),
    );

  }

  Widget submitButton(){

    return
      RaisedButton(
        child: Text("login"),
        onPressed: () {
          if(formKey.currentState.validate()){
            formKey.currentState.save();
          }

          print("submitted");
        },
      );


  }

}
