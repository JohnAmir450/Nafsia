import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nafsia/core/services/get_it_service.dart';
import 'package:nafsia/features/home/domain/models/sessions_model.dart';
import 'package:nafsia/features/home/domain/repos/home_repo.dart';
import 'package:nafsia/features/home/manager/communiity_sessions_cubit/community_sessions_cubit.dart';
import 'package:nafsia/features/home/presentation/views/widgets/group_chats_widgets/community_session_chat_view_body.dart';

class CommunitySessionChatView extends StatelessWidget {
  final SessionsModel communitySessionsModel;

  const CommunitySessionChatView({
    super.key,
    required this.communitySessionsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("رسائل المجموعة"),
      ),
      body: BlocProvider(
        create: (context) => CommunitySessionsCubit(getIt<HomeRepo>())
          ..getCommunitySessionMessages(sessionId: communitySessionsModel.id),
        child: CommunitySessionChatViewBody(
          communitySessionsModel: communitySessionsModel,
        ),
      ),
    );
  }
}




