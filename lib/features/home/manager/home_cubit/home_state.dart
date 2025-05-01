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
final class GetPostReactionsSuccessState extends HomeState {
  
}
final class SavePostFailureState extends HomeState {
  final String errorMessage;
  SavePostFailureState({required this.errorMessage});
}
final class SavePostSuccessState extends HomeState {}