import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nafsia/core/helper_functions/get_user_data.dart';
import 'package:nafsia/features/home/domain/models/community_messages_model.dart';
import 'package:nafsia/features/home/domain/models/sessions_model.dart';
import 'package:nafsia/features/home/domain/repos/home_repo.dart';

part 'community_sessions_state.dart';

class CommunitySessionsCubit extends Cubit<CommunitySessionsState> {
  final HomeRepo homeRepo;
  CommunitySessionsCubit(this.homeRepo)
      : super(CommunitySessionsInitialState());
  int currentPage = 0;

  List<SessionsModel>? allGroups;
  List<SessionsModel>? myGroups;
  Future<void> getCommunitySessions({String? userId}) async {
    emit(CommunitySessionsLoadingState());
    final result = await homeRepo.getCommunitySessions(userId: userId);
    result.fold(
      (failure) =>
          emit(CommunitySessionsFailureState(errorMessage: failure.message)),
      (sessions) {
        if (userId == null) {
          allGroups = sessions;
        } else {
          myGroups = sessions;
        }
        emit(CommunitySessionsSuccessState(communitySessions: sessions));
      },
    );
  }

  Future<void> participateInCommunitySession(
      {required String sessionId}) async {
    final result =
        await homeRepo.participateInCommunitySession(sessionId: sessionId);
    result.fold(
        (failure) => emit(ParticipateInCommunitySessionsFailureState(
            errorMessage: failure.message)),
        (_) => emit(ParticipateInCommunitySessionsSuccessState()));
  }

  emitState() {
    emit(CommunitySessionsToggleState());
  }

  void togglePage(int index) {
    currentPage = index;
    if (index == 1) {
      getCommunitySessions(userId: getUserData().user.id);
    } else if (index == 0) {
      getCommunitySessions();
    }

    emit(CommunitySessionsToggleState()); // triggers UI rebuild
  }

  Future<void> getCommunitySessionMessages({required String sessionId}) async {
    emit(GetCommunitySessionMessagesLoadingState());
    final result =
        await homeRepo.getCommunitySessionMessages(sessionId: sessionId);
    result.fold(
      (failure) => emit(GetCommunitySessionMessagesFailureState(
          errorMessage: failure.message)),
      (messages) {
        emit(GetCommunitySessionMessagesSuccessState(messages: messages));
      },
    );
  }
}
