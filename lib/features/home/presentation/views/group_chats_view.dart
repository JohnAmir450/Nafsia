import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nafsia/core/services/get_it_service.dart';
import 'package:nafsia/features/home/manager/communiity_sessions_cubit/community_sessions_cubit.dart';
import 'package:nafsia/features/home/presentation/views/widgets/group_chats_widgets/group_chats_view_body.dart';

import '../../domain/repos/home_repo.dart';

class GroupChatsView extends StatelessWidget {
  const GroupChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
     create: (context) => CommunitySessionsCubit(getIt<HomeRepo>()),
      child: const GroupChatsViewBody(),
    );
  }
}
