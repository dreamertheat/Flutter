import 'dart:async';
import 'package:udemy/blocs/Bloc.dart';
import 'package:udemy/blocs/ValidationBloc.dart';
import 'package:udemy/blocs/EmailValidators.dart';
class ValidationBloc extends Object with EmailValidators implements Bloc {

  final _emailController = StreamController<String>();
  final _passwordController = StreamController();

  get emailChange => _emailController.sink.add;
  Stream<String> get email => _emailController.stream.transform(validateEmail);

  get passwordChange => _passwordController.sink.add;
  Stream<String> get password => _passwordController.stream.transform(validatePassword);

  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
  }





}

final bloc = ValidationBloc();