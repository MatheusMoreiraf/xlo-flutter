import 'package:rxdart/rxdart.dart';
import 'package:xlo/blocs/login/button_state.dart';
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

  Stream<FieldState> get outEmail => Rx.combineLatest2(
        _emailController.stream.transform(emailValidator),
        outState,
        (a, b) {
          a.enabled = b.state != LoginState.LOADING;
          return a;
        },
      );

  Stream<FieldState> get outPassword => Rx.combineLatest2(
        _passwordController.stream.transform(passwordValidator),
        outState,
        (a, b) {
          a.enabled = b.state != LoginState.LOADING;
          return a;
        },
      );

  Stream<ButtonState> get outLoginButton => Rx.combineLatest3(
        outEmail,
        outPassword,
        outState,
        (a, b, c) {
          return ButtonState(
            loading: c.state == LoginState.LOADING,
            enabled: a.error == null &&
                b.error == null &&
                c.state != LoginState.LOADING,
          );
        },
      );

  Future<bool> loginWithEmail() async {
    _stateController.add(LoginBlocState(state: LoginState.LOADING));

    await Future.delayed(Duration(seconds: 3));

    _stateController.add(LoginBlocState(state: LoginState.DONE));

    return true;
  }

  Future<bool> loginWithFacebook() async {
    _stateController.add(LoginBlocState(state: LoginState.LOADING_FACE));

    await Future.delayed(Duration(seconds: 3));

    _stateController.add(LoginBlocState(state: LoginState.DONE));
    return true;
  }

  void dispose() {
    _stateController.close();
    _emailController.close();
    _passwordController.close();
  }
}
