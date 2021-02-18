

class Validators{

  String validateEmail (value) {
    if(value.contains("@") && value.length > 3){

    }else{
      return "enter more than 3 characters";
    }

    return null;
  }

  //
  String validatePassword(value) {


      if(value.length > 5){
      }else{
      return "enter more than 3 characters";
      }

      return null;
  }


  //

}