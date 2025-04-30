import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nafsia/features/auth/logic/repos/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepo authRepo;
  SignUpCubit(this.authRepo) : super(SignUpInitialState());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
   final formKey = GlobalKey<FormState>();
  String? selectedGender;
   Icon suffixIcon = const Icon(Icons.visibility);
  bool isObscured = true;
  void changePasswordVisibility() {
    isObscured = !isObscured;
    suffixIcon = isObscured
        ? const Icon(Icons.visibility)
        : const Icon(Icons.visibility_off);
    emit(SingUpChangePasswordVisibility());
  }
  Future signUp() async {
    emit(SignUpLoadingState());
    var result = await authRepo.signUp(
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
      age: int.parse(ageController.text),
      gender: selectedGender == 'ذكر' ? 'male' : 'female',
      phoneNumber: phoneNumberController.text,
      role: 'user',
    );
    result.fold(
        (failure) => emit(SignUpFailureState(errorMessage: failure.message)),
        (success) => emit(SignUpSuccessState()));
  }
}
