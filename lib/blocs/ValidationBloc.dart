import 'dart:async';
import 'package:udemy/blocs/Bloc.dart';
import 'package:udemy/blocs/EmailValidators.dart';
import 'package:rxdart/rxdart.dart';
class ValidationBloc extends Object with EmailValidators implements Bloc {

  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  get emailChange => _emailController.sink.add;
  Stream<String> get email => _emailController.stream.transform(validateEmail);

  get passwordChange => _passwordController.sink.add;
  Stream<String> get password => _passwordController.stream.transform(validatePassword);

  Stream<bool> get submitValid => Rx.combineLatest2(email, password, (a, b) {
    return true;
  });

  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
  }




}

