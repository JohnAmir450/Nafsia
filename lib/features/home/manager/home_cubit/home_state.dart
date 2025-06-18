part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitialState extends HomeState {}

final class GetAllPostsLoadingState extends HomeState {}

final class GetAllPostsSuccessState extends HomeState {
  final List<PostModel> posts;
  GetAllPostsSuccessState({required this.posts});
}

final class GetAllPostsFailureState extends HomeState {
  final String errorMessage;
  GetAllPostsFailureState({required this.errorMessage});
}

final class ReactPostSuccessState extends HomeState {}

final class ReactPostFailureState extends HomeState {
  final String errorMessage;
  ReactPostFailureState({required this.errorMessage});
}

final class GetPostReactionsSuccessState extends HomeState {}

final class SavePostFailureState extends HomeState {
  final String errorMessage;
  SavePostFailureState({required this.errorMessage});
}

final class SavePostSuccessState extends HomeState {}

final class GetSavedPostsLoadingState extends HomeState {}

final class GetSavedPostsSuccessState extends HomeState {
  final List<PostModel> posts;
  GetSavedPostsSuccessState({required this.posts});
}

final class GetSavedPostsFailureState extends HomeState {
  final String errorMessage;
  GetSavedPostsFailureState({required this.errorMessage});
}

final class RemovePostFromSavedPostsFailureState extends HomeState {
  final String errorMessage;
  RemovePostFromSavedPostsFailureState({required this.errorMessage});
}

final class RemovePostFromSavedPostsSuccessState extends HomeState {}

final class GetStressPredictionLoadingState extends HomeState {}

final class GetStressPredictionFailureState extends HomeState {
  final String errorMessage;
  GetStressPredictionFailureState({required this.errorMessage});
}

final class GetStressPredictionSuccessState extends HomeState {
  final int prediction;
  final int heartRate;
  final int spo2;
  GetStressPredictionSuccessState(
      {required this.prediction, required this.heartRate, required this.spo2});
}

final class GetLatestSensorDataLoadingState extends HomeState {}

final class GetLatestSensorDataFailureState extends HomeState {
  final String errorMessage;
  GetLatestSensorDataFailureState({required this.errorMessage});
}

final class GetLatestSensorDataSuccessState extends HomeState {
  final int heartRate;
  final int spo2;

  GetLatestSensorDataSuccessState(
      {required this.heartRate, required this.spo2});
}

final class GetDoctorProfileFailureState extends HomeState {
  final String errorMessage;
  GetDoctorProfileFailureState({required this.errorMessage});
}

final class GetDoctorProfileSuccessState extends HomeState {
  final DoctorModel doctorModel;
  GetDoctorProfileSuccessState({required this.doctorModel});
}

final class GetDoctorProfileLoadingState extends HomeState {}
