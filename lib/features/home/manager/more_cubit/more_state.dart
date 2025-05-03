part of 'more_cubit.dart';

@immutable
sealed class MoreState {}

final class MoreInitialState extends MoreState {}

final class UpdateUserProfileLoadingState extends MoreState {}

final class UpdateUserProfileSuccessState extends MoreState {}

final class UpdateUserProfileFailureState extends MoreState {
  final String errorMessage;
  UpdateUserProfileFailureState({required this.errorMessage});
}

final class UserMakeChangesInProfile extends MoreState {}


