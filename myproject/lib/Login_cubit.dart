import 'package:flutter_bloc/flutter_bloc.dart';
import 'Login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  void onEmailChanged(String value) {
    final isValid = _validate(value, state.password);
    emit(state.copyWith(email: value, isValid: isValid));
  }

  void onPasswordChanged(String password) {
    final isValid = _validate(state.email, password);
    emit(state.copyWith(password: password, isValid: isValid));
  }


  void onClear() {
    emit(const LoginState());
  }

  bool _validate(String email, String password) {
    return email.contains('@') && password.length >= 6;
  }
}