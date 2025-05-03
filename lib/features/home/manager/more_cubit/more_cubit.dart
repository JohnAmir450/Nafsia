import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nafsia/features/auth/logic/repos/auth_repo.dart';

part 'more_state.dart';

class MoreCubit extends Cubit<MoreState> {
  final AuthRepo authRepo;

  MoreCubit(this.authRepo,) : super(MoreInitialState());

  final TextEditingController updatedNameController = TextEditingController();
  final TextEditingController updatedAgeController = TextEditingController();
  final TextEditingController updatedPhoneController = TextEditingController();
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool hasChanges = false;
  Future<void> updateUserProfile(
      {String? name, String? phone, int? age}) async {
    emit(UpdateUserProfileLoadingState());
    var result =
        await authRepo.updateUserProfile(name: name, phone: phone, age: age);

    result.fold(
        (failure) =>
            emit(UpdateUserProfileFailureState(errorMessage: failure.message)),
        (success) => emit(UpdateUserProfileSuccessState()));
  }

  Future<void> changeUserPassword({required String oldPassword,required String newPassword}) async {
    emit(ChangeUserPasswordLoadingState());
    var result = await authRepo.changeUserPassword(
        oldPassword: oldPassword,
        newPassword:newPassword,
        );
    result.fold(
        (failure) =>
            emit(ChangeUserPasswordFailureState(errorMessage: failure.message)),
        (success) => emit(ChangeUserPasswordSuccessState()));
  }

  Future<void> logOut() async {
    
    var result = await authRepo.logout();
    result.fold(
        (failure) => emit(LogOutFailureState(errorMessage: failure.message)),
        (success) => emit(LogOutSuccessState()));
  }
  void userMakeChanges() {
    hasChanges = true;
    emit(UserMakeChangesInProfile());
  }
}
