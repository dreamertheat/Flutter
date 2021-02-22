

import 'dart:async';


class EmailValidators{

  final validateEmail = StreamTransformer<String,String>.fromHandlers(
      handleData: (String email,sink){
        if(email.contains("@")){
          sink.add(email);
        }else{
          sink.addError("Invalid email!");
        }
      }
  );


  final validatePassword = StreamTransformer<String,String>.fromHandlers(
      handleData: (String password,sink){
        if(password.length>=5){
          sink.add(password);
        }else{
          sink.addError("Atleast 5 characters");
        }
      }
  );


}