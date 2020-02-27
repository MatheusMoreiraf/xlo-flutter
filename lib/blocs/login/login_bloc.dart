import 'package:rxdart/rxdart.dart';
import 'package:xlo/blocs/login/field_state.dart';
import 'package:xlo/blocs/login/login_bloc_state.dart';
import 'package:xlo/validators/login_validator.dart';

class LoginBloc with LoginValidator {
  final _stateController = BehaviorSubject<LoginBlocState>.seeded(
    LoginBlocState(state: LoginState.IDLE),
  );
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Function(String) get changeEmail => _emailController.sink.add;

  Function(String) get changePassword => _passwordController.sink.add;

  Stream<LoginBlocState> get outState => _stateController.stream;

  Stream<FieldState> get outEmail =>
      _emailController.stream.transform(emailValidator);

  Stream<FieldState> get outPassword =>
      _passwordController.stream.transform(passwordValidator);

  void dispose() {
    _stateController.close();
    _emailController.close();
    _passwordController.close();
  }
}
