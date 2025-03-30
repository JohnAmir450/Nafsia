part of 'mood_cubit.dart';

@immutable
sealed class MoodState {}

final class MoodInitialState extends MoodState {}

final class MoodLoadingState extends MoodState {}


final class MoodFailureState extends MoodState {
  final String errorMessage;

  MoodFailureState({required this.errorMessage});
}


final class AddMoodSuccessState extends MoodState {}


