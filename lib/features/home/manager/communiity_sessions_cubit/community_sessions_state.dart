part of 'community_sessions_cubit.dart';

@immutable
sealed class CommunitySessionsState {}

final class CommunitySessionsInitialState extends CommunitySessionsState {}

final class CommunitySessionsToggleState extends CommunitySessionsState {}

final class CommunitySessionsLoadingState extends CommunitySessionsState {}

final class CommunitySessionsSuccessState extends CommunitySessionsState {
  final List<SessionsModel> communitySessions;
  final int currentTabIndex;
  CommunitySessionsSuccessState(
      {required this.communitySessions, this.currentTabIndex = 0});
}

final class CommunitySessionsFailureState extends CommunitySessionsState {
  final String errorMessage;

  CommunitySessionsFailureState({required this.errorMessage});
}

final class ParticipateInCommunitySessionsSuccessState
    extends CommunitySessionsState {}

final class ParticipateInCommunitySessionsFailureState
    extends CommunitySessionsState {
  final String errorMessage;

  ParticipateInCommunitySessionsFailureState({required this.errorMessage});
}


final class GetCommunitySessionMessagesLoadingState extends CommunitySessionsState {}



final class GetCommunitySessionMessagesSuccessState extends CommunitySessionsState {
  final List<CommunityMessageModel>messages;

  GetCommunitySessionMessagesSuccessState({required this.messages});
}


final class GetCommunitySessionMessagesFailureState extends CommunitySessionsState {
  final String errorMessage;

  GetCommunitySessionMessagesFailureState({required this.errorMessage});
}


