import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nafsia/features/auth/logic/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;
  LoginCubit(this.authRepo) : super(LoginInitialState());

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
   Icon suffixIcon = const Icon(Icons.visibility);
  bool isObscured = true;
  void changePasswordVisibility() {
    isObscured = !isObscured;
    suffixIcon = isObscured
        ? const Icon(Icons.visibility)
        : const Icon(Icons.visibility_off);
    emit(LoginChangePasswordVisibility());
  }
  Future login() async {
    emit(LoginLoadingState());
    var result = await authRepo.logIn(
      email: emailController.text,
      password: passwordController.text,
    );
    result.fold(
        (failure) => emit(LoginFailureState(errorMessage: failure.message)),
        (success) => emit(LoginSuccessState()));
  }
}
