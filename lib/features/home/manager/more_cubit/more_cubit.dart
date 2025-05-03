import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nafsia/features/auth/logic/repos/auth_repo.dart';
import 'package:nafsia/features/home/domain/models/posts_model.dart';
import 'package:nafsia/features/home/domain/repos/home_repo.dart';

part 'more_state.dart';

class MoreCubit extends Cubit<MoreState> {
  final AuthRepo authRepo;
  final HomeRepo homeRepo;
  MoreCubit(this.authRepo, this.homeRepo) : super(MoreInitialState());

  final TextEditingController updatedNameController = TextEditingController();
  final TextEditingController updatedAgeController = TextEditingController();
  final TextEditingController updatedPhoneController = TextEditingController();
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

  void userMakeChanges() {
    hasChanges = true;
    emit(UserMakeChangesInProfile());
  }

  
}
