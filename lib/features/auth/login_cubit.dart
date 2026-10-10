import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());

    await Future.delayed(const Duration(seconds: 2));

    if (email.isNotEmpty && password.isNotEmpty) {
      emit(LoginSuccess());
    } else {
      emit(LoginError('Please enter email and password'));
    }
  }
}