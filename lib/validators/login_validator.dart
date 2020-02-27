import 'dart:async';

import 'package:xlo/blocs/login/field_state.dart';
import 'package:xlo/helpers/format_fild.dart';

class LoginValidator {
  final emailValidator = StreamTransformer<String, FieldState>.fromHandlers(
      handleData: (email, sink) {
    if (email.isEmpty)
      sink.add(FieldState(error: 'Campo obrigatório'));
    else if (!isEmailValid(email))
      sink.add(FieldState(error: 'E-mail inválido'));
    else
      sink.add(FieldState());
  });

  final passwordValidator = StreamTransformer<String, FieldState>.fromHandlers(
    handleData: (pass, sink) {
      if (pass.isEmpty)
        sink.add(FieldState(error: 'Campo obrigatório!'));
      else
        sink.add(FieldState());
    },
  );
}
