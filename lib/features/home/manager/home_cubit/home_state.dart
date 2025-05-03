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