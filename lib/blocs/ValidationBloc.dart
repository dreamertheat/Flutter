import 'dart:async';
import 'package:udemy/blocs/Bloc.dart';
import 'package:udemy/blocs/EmailValidators.dart';
import 'package:rxdart/rxdart.dart';
class ValidationBloc extends Object with EmailValidators implements Bloc {

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  get emailChange => _emailController.sink.add;
  Stream<String> get email => _emailController.stream.transform(validateEmail);

  get passwordChange => _passwordController.sink.add;
  Stream<String> get password => _passwordController.stream.transform(validatePassword);

  Stream<bool> get submitValid => Rx.combineLatest2(email, password, (a, b) {
    return true;
  });


  submit(){
      final email = _emailController.value;
      final pass = _passwordController.value;

      print(email+" "+pass);
  }

  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
  }




}

