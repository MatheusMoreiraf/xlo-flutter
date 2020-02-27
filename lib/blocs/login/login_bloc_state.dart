import 'package:flutter/material.dart';

enum LoginState { IDLE, LOADING, LOADING_FACE, ERROR, DONE }

class LoginBlocState {
  LoginState state;
  String errorMessage;

  LoginBlocState({@required this.state, this.errorMessage});
}
