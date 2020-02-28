import 'package:rxdart/rxdart.dart';

enum SignUpState { IDLE, LOADING, ERROR }

class SignUpBlocState {
  SignUpState state;
  String errorMessage;

  SignUpBlocState(this.state, {this.errorMessage});
}

class SignUpBloc {
  final _stateController = BehaviorSubject<SignUpBlocState>.seeded(
    SignUpBlocState(SignUpState.IDLE),
  );

  Stream<SignUpBlocState> get outState => _stateController.stream;

  void dispose() {
    _stateController.close();
  }
}
