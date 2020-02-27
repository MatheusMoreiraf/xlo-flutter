import 'dart:async';

import 'package:rxdart/rxdart.dart';

class LoginBloc {
  final  _emailController = BehaviorSubject<String>();
  final  _passwordController = BehaviorSubject<String>();

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}